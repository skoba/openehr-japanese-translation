# frozen_string_literal: true
# Japanese translation for openEHR-EHR-SECTION.adhoc.v1 (CKM 1.0.12)
# Filled following glossary-ja.md. Human proofreading: edit work/openEHR-EHR-SECTION.adhoc.v1.ja.tsv
# and run `make import ID=openEHR-EHR-SECTION.adhoc.v1` (regenerates this file).

T = {
  ['description', '-', 'purpose'] =>
    'テンプレート内で特定の臨床的文脈に合わせて名前を変更して使う、汎用のセクション見出しを提供するため。',
  ['description', '-', 'use'] =>
    'テンプレート内で、特定の臨床的文脈に合わせて名前を変更するセクション見出しを構成するために用いる。例：「任意見出し」を「診察所見」に変更する。',
  ['description', '-', 'misuse'] =>
    'テンプレート内で名前を変更せずにそのまま残してはならない。',
  ['description', '-', 'copyright'] => '© openEHR Foundation',

  ['term', 'at0000', 'text'] => '任意見出し',
  ['term', 'at0000', 'description'] => 'テンプレート内で特定の臨床的文脈に合わせて名前を変更すべき、汎用のセクション見出し。',
}.freeze

# note 列に残すメモ。迷った訳語には '要確認: ...' を付ける。
NOTES = {
  ['term', 'at0000', 'text'] => '要確認: 「任意見出し」を採用（targets.tsv の案。他候補: アドホック見出し、汎用見出し）。テンプレートで必ず改名される前提のラベル',
}.freeze

src, dst = ARGV
lines = File.readlines(src, chomp: true)
out = [lines.shift]
lines.each do |l|
  c = l.split("\t", -1)
  key = c[1..3]
  c[6] = T.fetch(key).gsub("\n", '\n')
  c[7] = NOTES[key] || ''
  out << c.join("\t")
end
File.write(dst, out.join("\n") + "\n")
