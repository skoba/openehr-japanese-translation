#!/usr/bin/env ruby
# frozen_string_literal: true
#
# style_examples.rb - build docs/style-examples.md, the before/after corpus of the
# maintainer's proofreads, from git history.
#
#   ruby tools/style_examples.rb > docs/style-examples.md      (make examples)
#
# Every proofread commit (subject "review: … 校正 …", excluding the mechanical
# "…に統一" term propagations) that touches a work/<id>.ja.tsv
# contributes the rows whose target text changed (OLD = before the commit,
# NEW = after). Static sections under docs/style-examples/*.md (for proofreads
# whose history was squashed) are appended verbatim. Agents read the result as
# few-shot examples before translating (see glossary-ja.md 文体規則).

require 'open3'

def sh(*cmd)
  out, st = Open3.capture2(*cmd)
  abort "#{cmd.join(' ')} failed" unless st.success?
  out
end

def rows(tsv)
  tsv.lines.drop(1).map { |l| c = l.chomp.split("\t", -1); [c[1..3].join('/'), c] }.to_h
end

commits = sh('git', 'log', '--reverse', '--format=%H%x09%ad%x09%s', '--date=short', '--', 'archetypes/*/work/*.ja.tsv').lines
        .map { |l| l.chomp.split("\t", 3) }.select { |_, _, s| s.start_with?('review:') && s.include?('校正') && !s.include?('に統一') }

puts '# 校正例（校正前 → 校正後）'
puts
puts '`tools/style_examples.rb` が `review:` コミットから生成する。翻訳前に読み、NEW の方向で訳す（glossary-ja.md「こなれた訳のための規則」）。手で編集しない（`make examples` で再生成）。'
puts
total = 0
commits.each do |sha, date, subject|
  files = sh('git', 'show', '--name-only', '--format=', sha).lines.map(&:chomp).select { |f| f =~ %r{archetypes/.+/work/.+\.ja\.tsv$} }
  files.each do |f|
    id = f[%r{archetypes/([^/]+)/}, 1]
    old = rows(sh('git', 'show', "#{sha}^:#{f}")) rescue {}
    new = rows(sh('git', 'show', "#{sha}:#{f}"))
    changed = new.select { |k, c| o = old[k]; o && o[6] != c[6] && !o[6].empty? }
    next if changed.empty?
    puts "## #{id} — #{subject.sub(/^review: /, '')}（#{date}）"
    puts
    changed.each do |k, c|
      o = old[k]
      puts "### #{k}"
      puts "- EN : #{c[5]}"
      puts "- OLD: #{o[6]}"
      puts "- NEW: #{c[6]}"
      puts
      total += 1
    end
  end
end
Dir.glob('docs/style-examples/*.md').sort.each do |f|
  puts File.read(f)
  puts
end
$stderr.puts "#{total} rows from #{commits.size} review commit(s)"
