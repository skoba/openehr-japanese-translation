# frozen_string_literal: true
# Japanese translation for openEHR-EHR-SECTION.referral_details.v0

T = {
  ['description', '-', 'purpose'] =>
    'テンプレート内で紹介状をモデル化するための枠組みの例を提供するため。',
  ['description', '-', 'use'] =>
    "テンプレート内で紹介状をモデル化するための枠組みの例を提供するために用いる。\n\n本アーキタイプは、COMPOSITION.request または関連する任意の COMPOSITION アーキタイプの中に入れ子にして用いることを意図している。",
  ['description', '-', 'keywords'] => '紹介 | 依頼 | 紹介状',
  ['description', '-', 'copyright'] => '© openEHR Foundation',
  ['term', 'at0000', 'text'] => '紹介状の詳細',
  ['term', 'at0000', 'description'] => '紹介状のテンプレートをモデル化するための枠組みの例。',
  ['term', 'at0001', 'text'] => '紹介依頼',
  ['term', 'at0001', 'description'] => '紹介依頼に関する詳細。',
  ['term', 'at0002', 'text'] => '詳細',
  ['term', 'at0002', 'description'] => '紹介を裏付ける追加の臨床的詳細。'
}.freeze

NOTES = {
  ['term', 'at0000', 'text'] => '要確認: SECTION 名。「紹介状の詳細」（他候補: 紹介詳細／紹介情報）',
  ['term', 'at0001', 'text'] => '要確認: INSTRUCTION.service_request のスロット。「紹介依頼」（service_request 本体の概念名とは別に、スロット名として簡潔に）',
  ['term', 'at0002', 'text'] => 'clinical_synopsis / story / exam / imaging_exam_result / laboratory_test_result のスロット。「詳細」のまま',
  ['description', '-', 'keywords'] => '原文2語に「紹介状」を追加'
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
