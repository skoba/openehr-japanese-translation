#!/usr/bin/env ruby
# frozen_string_literal: true
#
# adl_i18n.rb - ADL 1.4 archetype translation helper (extract / inject / check)
#
#   ruby adl_i18n.rb extract  ARCHETYPE.adl [--lang en] [--target ja] > terms.tsv
#   ruby adl_i18n.rb inject   ARCHETYPE.adl terms.tsv --target ja \
#          --author "Name" --organisation "Org" --email "mail" [--accreditation "..."] \
#          -o ARCHETYPE.ja.adl
#   ruby adl_i18n.rb check    ARCHETYPE.adl [--target ja]
#   ruby adl_i18n.rb diff     MINE.tsv CKM_EXPORT.adl [--target ja] > edits.tsv
#
# extract: parses the archetype with openehr-ruby and writes a TSV of every
#          translatable string (description details + term/constraint definitions)
#          with the source-language text and an empty target column.
# inject:  reads the TSV back and inserts the target-language blocks into the
#          ADL text (translations, description.details, ontology.term_definitions,
#          ontology.constraint_definitions) without touching the definition
#          section, then re-parses the result and runs `check`.
# check:   asserts that every code present in the source language exists in the
#          target language (and vice versa) and that no field is left untranslated.
# diff:    compares the target column of a TSV (the draft that was handed over)
#          with the target-language text found in an ADL exported from CKM after
#          editing, and prints only the rows whose text was changed (draft vs CKM).
#
# openehr-ruby is loaded from the installed gem, or from ADL_I18N_LIBS
# (colon-separated $LOAD_PATH entries) when working from source checkouts.

require 'optparse'
require 'csv'

if ENV['ADL_I18N_LIBS']
  ENV['ADL_I18N_LIBS'].split(':').each { |p| $LOAD_PATH.unshift(p) }
end
require 'openehr'

module AdlI18n
  TSV_HEADER = %w[archetype section code field context source target note].freeze
  DETAIL_FIELDS = %w[purpose use misuse keywords copyright].freeze
  TERM_FIELDS = %w[text description comment].freeze

  module_function

  def parse(path)
    OpenEHR::Parser::ADLParser.new(path).parse
  end

  # ---------------------------------------------------------------- extract
  def extract(path, src:, target:, io: $stdout)
    a = parse(path)
    id = a.archetype_id.value
    rows = []

    details = a.description.details
    src_d = details[src] or abort "no description.details[#{src}] in #{path}"
    tgt_d = details[target]
    DETAIL_FIELDS.each do |f|
      val = src_d.send(f)
      next if val.nil? || (val.respond_to?(:empty?) && val.empty?)
      val = val.join(' | ') if val.is_a?(Array)
      tval = tgt_d&.send(f)
      tval = tval.join(' | ') if tval.is_a?(Array)
      rows << [id, 'description', '-', f, '', val, tval.to_s, '']
    end

    ont = a.ontology
    [[:term_definitions, 'term'], [:constraint_definitions, 'constraint']].each do |attr, section|
      defs = ont.send(attr) or next
      src_defs = defs[src] or next
      tgt_defs = defs[target] || {}
      src_defs.keys.sort_by { |c| c[/\d+/].to_i }.each do |code|
        item = src_defs[code].items
        titem = tgt_defs[code]&.items || {}
        TERM_FIELDS.each do |f|
          next unless item.key?(f)
          rows << [id, section, code, f, node_context(a, code), item[f], titem[f].to_s, '']
        end
      end
    end

    io.puts TSV_HEADER.join("\t")
    rows.each { |r| io.puts r.map { |v| escape_tsv(v) }.join("\t") }
    rows
  end

  # Path-like context for an at-code so translators see where a node lives.
  def node_context(archetype, code)
    return '' unless code.start_with?('at')
    ctx = nil
    walk = lambda do |obj, path|
      return if ctx
      if obj.respond_to?(:node_id) && obj.node_id == code
        ctx = path.join(' > ')
        return
      end
      if obj.respond_to?(:attributes) && obj.attributes
        obj.attributes.each do |attr|
          next unless attr.respond_to?(:children) && attr.children
          attr.children.each do |ch|
            label = ch.respond_to?(:rm_type_name) ? ch.rm_type_name : ch.class.name.split('::').last
            walk.call(ch, path + ["#{attr.rm_attribute_name}/#{label}"])
          end
        end
      end
    end
    walk.call(archetype.definition, [archetype.definition.rm_type_name])
    ctx.to_s
  rescue StandardError
    ''
  end

  def escape_tsv(v)
    v.to_s.gsub("\r\n", "\n").gsub("\t", ' ').gsub("\n", '\n')
  end

  def unescape_tsv(v)
    v.to_s.gsub('\n', "\n")
  end

  def read_tsv(path)
    rows = []
    File.readlines(path, chomp: true).each_with_index do |line, i|
      next if line.strip.empty?
      cols = line.split("\t", -1)
      if i.zero? && cols.first == 'archetype'
        next
      end
      h = TSV_HEADER.zip(cols).to_h
      h['source'] = unescape_tsv(h['source'])
      h['target'] = unescape_tsv(h['target'])
      rows << h
    end
    rows
  end

  # ----------------------------------------------------------------- inject
  def inject(path, tsv, target:, author:, out:)
    rows = read_tsv(tsv)
    # an empty source (e.g. misuse = <"">) legitimately stays empty
    missing = rows.select { |r| r['target'].to_s.strip.empty? && !r['source'].to_s.strip.empty? }
    unless missing.empty?
      abort "untranslated rows:\n" + missing.map { |r| "  #{r['section']} #{r['code']} #{r['field']}" }.join("\n")
    end

    src = File.read(path, encoding: 'UTF-8')
    bom_char = [0xFEFF].pack('U')
    bom = src.start_with?(bom_char) ? bom_char : ''
    src = src.delete_prefix(bom_char)
    eol = src.include?("\r\n") ? "\r\n" : "\n"
    lines = src.split(/\r?\n/, -1)
    rows.each { |r| r['target'] = r['target'].gsub("\r\n", "\n").gsub("\n", eol) }

    lines = inject_translation_header(lines, target, author)
    lines = inject_details(lines, target, rows.select { |r| r['section'] == 'description' })
    lines = inject_terms(lines, 'term_definitions', target, rows.select { |r| r['section'] == 'term' })
    lines = inject_terms(lines, 'constraint_definitions', target, rows.select { |r| r['section'] == 'constraint' })

    File.write(out, bom + lines.join(eol), encoding: 'UTF-8')
    out
  end

  def quote(s)
    "\"#{s.to_s.gsub('"', '\"')}\""
  end

  # translations = < ... > inside the language section.  Creates the block
  # when the archetype has no translations yet.
  def inject_translation_header(lines, lang, author)
    block = ["\t\t[\"#{lang}\"] = <",
             "\t\t\tlanguage = <[ISO_639-1::#{lang}]>",
             "\t\t\tauthor = <"]
    %w[name organisation email].each do |k|
      block << "\t\t\t\t[\"#{k}\"] = <#{quote(author[k])}>" if author[k] && !author[k].empty?
    end
    block << "\t\t\t>"
    block << "\t\t\taccreditation = <#{quote(author['accreditation'])}>" if author['accreditation'] && !author['accreditation'].empty?
    block << "\t\t>"

    if (i = lines.index { |l| l =~ /\A\ttranslations = <\s*\z/ })
      close = find_close(lines, i, "\t")
      raise "translation for #{lang} already present" if lines[i...close].any? { |l| l =~ /\A\t\t\["#{lang}"\] = </ }
      lines[0...close] + block + lines[close..]
    else
      i = lines.index { |l| l =~ /\A\toriginal_language = / } or raise 'original_language not found'
      lines[0..i] + ["\ttranslations = <"] + block + ["\t>"] + lines[(i + 1)..]
    end
  end

  def inject_details(lines, lang, rows)
    return lines if rows.empty?
    i = lines.index { |l| l =~ /\A\tdetails = <\s*\z/ } or raise 'description.details not found'
    close = find_close(lines, i, "\t")
    raise "details[#{lang}] already present" if lines[i...close].any? { |l| l =~ /\A\t\t\["#{lang}"\] = </ }
    by = rows.to_h { |r| [r['field'], r['target']] }
    block = ["\t\t[\"#{lang}\"] = <", "\t\t\tlanguage = <[ISO_639-1::#{lang}]>"]
    %w[purpose use misuse].each do |f|
      block << "\t\t\t#{f} = <#{quote(by[f])}>" if by.key?(f)
    end
    if by.key?('keywords')
      kws = by['keywords'].split('|').map(&:strip).reject(&:empty?)
      block << "\t\t\tkeywords = <#{kws.map { |k| quote(k) }.join(', ')}>"
    end
    block << "\t\t\tcopyright = <#{quote(by['copyright'])}>" if by.key?('copyright')
    block << "\t\t>"
    lines[0...close] + block + lines[close..]
  end

  def inject_terms(lines, section, lang, rows)
    return lines if rows.empty?
    i = lines.index { |l| l =~ /\A\t#{section} = <\s*\z/ } or raise "#{section} not found"
    close = find_close(lines, i, "\t")
    raise "#{section}[#{lang}] already present" if lines[i...close].any? { |l| l =~ /\A\t\t\["#{lang}"\] = </ }
    block = ["\t\t[\"#{lang}\"] = <", "\t\t\titems = <"]
    rows.group_by { |r| r['code'] }.each do |code, rs|
      block << "\t\t\t\t[\"#{code}\"] = <"
      by = rs.to_h { |r| [r['field'], r['target']] }
      TERM_FIELDS.each do |f|
        block << "\t\t\t\t\t#{f} = <#{quote(by[f])}>" if by.key?(f)
      end
      block << "\t\t\t\t>"
    end
    block << "\t\t\t>"
    block << "\t\t>"
    lines[0...close] + block + lines[close..]
  end

  # Index of the line that closes the block opened at +open_idx+ with the
  # given indentation (CKM output is tab-indented, one level per nesting).
  def find_close(lines, open_idx, indent)
    j = lines[(open_idx + 1)..].index { |l| l == "#{indent}>" }
    raise "closing '>' not found for block at line #{open_idx + 1}" unless j
    open_idx + 1 + j
  end

  # ------------------------------------------------------------------- diff
  # rows whose target text differs between a draft TSV and an ADL that carries
  # the reviewed translation (e.g. downloaded from CKM after editing there).
  def diff(tsv, adl, src:, target:, io: $stdout)
    draft = read_tsv(tsv)
    reviewed = {}
    extract(adl, src: src, target: target, io: File.open(File::NULL, 'w')).each do |r|
      reviewed[[r[1], r[2], r[3]]] = unescape_tsv(r[6])
    end
    io.puts %w[section code field draft reviewed].join("\t")
    n = 0
    draft.each do |r|
      key = [r['section'], r['code'], r['field']]
      next unless reviewed.key?(key)
      a = r['target'].gsub("\r\n", "\n").strip
      b = reviewed[key].gsub("\r\n", "\n").strip
      next if a == b
      n += 1
      io.puts [key, escape_tsv(a), escape_tsv(b)].flatten.join("\t")
    end
    $stderr.puts "#{n} changed row(s)"
    n
  end

  # ------------------------------------------------------------------ check
  def check(path, src:, target:, io: $stdout)
    a = parse(path)
    ok = true
    report = ->(msg) { io.puts "  #{msg}"; ok = false }

    trans = a.translations || {}
    report.call("translations[#{target}] missing") unless trans.key?(target)
    details = a.description.details
    if details[target]
      %w[purpose use misuse].each do |f|
        v = details[target].send(f)
        sv = details[src]&.send(f)
        next if sv.nil? || sv.strip.empty?
        report.call("details[#{target}].#{f} empty") if v.nil? || v.strip.empty?
      end
    else
      report.call("description.details[#{target}] missing")
    end

    ont = a.ontology
    [[:term_definitions, 'term'], [:constraint_definitions, 'constraint']].each do |attr, label|
      defs = ont.send(attr) or next
      s = defs[src] or next
      t = defs[target]
      unless t
        report.call("#{label}_definitions[#{target}] missing")
        next
      end
      (s.keys - t.keys).each { |c| report.call("#{label} #{c} missing in #{target}") }
      (t.keys - s.keys).each { |c| report.call("#{label} #{c} present in #{target} but not in #{src}") }
      (s.keys & t.keys).each do |c|
        si = s[c].items
        ti = t[c].items
        (si.keys - ti.keys).each { |f| report.call("#{label} #{c}.#{f} missing in #{target}") }
        ti.each do |f, v|
          report.call("#{label} #{c}.#{f} empty") if v.to_s.strip.empty?
          report.call("#{label} #{c}.#{f} still placeholder: #{v}") if v.to_s.start_with?('*') && v.to_s.end_with?(')')
        end
      end
    end
    io.puts(ok ? "OK: #{a.archetype_id.value} [#{target}] complete" : "FAILED: #{path}")
    ok
  end
end

# ------------------------------------------------------------------- CLI
if $PROGRAM_NAME == __FILE__
  cmd = ARGV.shift
  opts = { src: 'en', target: 'ja', author: {} }
  parser = OptionParser.new do |o|
    o.on('--lang L', 'source language (default en)') { |v| opts[:src] = v }
    o.on('--target L', 'target language (default ja)') { |v| opts[:target] = v }
    o.on('--author NAME') { |v| opts[:author]['name'] = v }
    o.on('--organisation ORG') { |v| opts[:author]['organisation'] = v }
    o.on('--email MAIL') { |v| opts[:author]['email'] = v }
    o.on('--accreditation ACC') { |v| opts[:author]['accreditation'] = v }
    o.on('-o', '--out FILE') { |v| opts[:out] = v }
  end
  args = parser.parse(ARGV)

  case cmd
  when 'extract'
    AdlI18n.extract(args[0], src: opts[:src], target: opts[:target])
  when 'inject'
    out = opts[:out] || args[0].sub(/\.adl\z/, ".#{opts[:target]}.adl")
    AdlI18n.inject(args[0], args[1], target: opts[:target], author: opts[:author], out: out)
    $stderr.puts "wrote #{out}"
    exit(AdlI18n.check(out, src: opts[:src], target: opts[:target]) ? 0 : 1)
  when 'check'
    exit(AdlI18n.check(args[0], src: opts[:src], target: opts[:target]) ? 0 : 1)
  when 'diff'
    AdlI18n.diff(args[0], args[1], src: opts[:src], target: opts[:target])
  else
    $stderr.puts parser.banner
    $stderr.puts "commands: extract | inject | check | diff"
    exit 2
  end
end
