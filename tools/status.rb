#!/usr/bin/env ruby
# frozen_string_literal: true
#
# status.rb - maintain status.tsv, the per-archetype workflow state.
#
#   ruby tools/status.rb list
#   ruby tools/status.rb set ARCHETYPE_ID STATE [CKM_URL]
#
# status.tsv (repository root) columns: archetype_id, state, revision, ckm_url, updated
# states, in order:  todo -> in_progress -> review -> uploaded -> accepted
#
# `set` never moves a row backwards (so `make build` on an archetype that is
# already `uploaded` leaves it at `uploaded`); set FORCE=1 in the environment to
# override.  `revision` is always refreshed from archetypes/<id>/source/<id>.adl
# (`["revision"]`).  `uploaded` and `accepted` are recorded by humans only, via
# `make set-status` - agents must not advance a row that far (see CLAUDE.md).

require 'date'

STATUS_FILE = File.expand_path('../status.tsv', __dir__)
ARCHETYPES  = File.expand_path('../archetypes', __dir__)
STATES = %w[todo in_progress review uploaded accepted].freeze
HEADER = %w[archetype_id state revision ckm_url updated].freeze

def load_rows
  return [] unless File.exist?(STATUS_FILE)

  lines = File.readlines(STATUS_FILE, chomp: true).reject(&:empty?)
  abort "#{STATUS_FILE}: unexpected header #{lines.first.inspect}" unless lines.first.split("\t") == HEADER
  lines[1..].map { |l| HEADER.zip(l.split("\t", -1)).to_h }
end

def save_rows(rows)
  body = ([HEADER] + rows.map { |r| HEADER.map { |k| r[k].to_s } }).map { |c| c.join("\t") }
  File.write(STATUS_FILE, body.join("\n") + "\n")
end

def revision_of(id)
  path = File.join(ARCHETYPES, id, 'source', "#{id}.adl")
  return nil unless File.exist?(path)

  File.read(path, encoding: 'bom|utf-8')[/\["revision"\]\s*=\s*<"([^"]*)">/, 1].to_s
end

def list(rows)
  w = [rows.map { |r| r['archetype_id'].size }.max.to_i, 12].max
  rows.each do |r|
    puts format("%-#{w}s  %-11s  %-12s  %-10s  %s", r['archetype_id'], r['state'], r['revision'],
                r['updated'], r['ckm_url'].to_s.empty? ? '-' : r['ckm_url'])
  end
end

def set(rows, id, state, url)
  abort "unknown state #{state.inspect}; expected one of: #{STATES.join(' -> ')}" unless STATES.include?(state)
  rev = revision_of(id)
  if rev.nil? && state != 'todo'
    abort "archetypes/#{id}/source/#{id}.adl not found; run `make new` first (only `todo` can be set without it)"
  end
  rev ||= ''

  row = rows.find { |r| r['archetype_id'] == id }
  today = Date.today.iso8601
  if row.nil?
    rows << { 'archetype_id' => id, 'state' => state, 'revision' => rev, 'ckm_url' => url.to_s, 'updated' => today }
    save_rows(rows)
    puts "status: #{id} -> #{state}"
    return
  end

  cur = STATES.index(row['state']) or abort "#{STATUS_FILE}: #{id} has unknown state #{row['state'].inspect}"
  changed = false
  if STATES.index(state) < cur && ENV['FORCE'] != '1'
    warn "status: #{id} stays #{row['state']} (#{state} would go backwards; FORCE=1 to override)"
  elsif row['state'] != state
    row['state'] = state
    changed = true
  end
  if url && !url.empty? && row['ckm_url'] != url
    row['ckm_url'] = url
    changed = true
  end
  if row['revision'] != rev
    row['revision'] = rev
    changed = true
  end
  if changed
    row['updated'] = today
    save_rows(rows)
    puts "status: #{id} -> #{row['state']}#{" (revision #{rev})" unless rev.empty?}"
  else
    puts "status: #{id} unchanged (#{row['state']})"
  end
end

case ARGV.shift
when 'list'
  list(load_rows)
when 'set'
  id, state, url = ARGV
  abort 'usage: status.rb set ARCHETYPE_ID STATE [CKM_URL]' if id.nil? || state.nil?
  set(load_rows, id, state, url)
else
  warn 'usage: status.rb list | set ARCHETYPE_ID STATE [CKM_URL]   (FORCE=1 to move a state backwards)'
  exit 2
end
