# frozen_string_literal: true
# Japanese translation for openEHR-EHR-OBSERVATION.story.v1 (CKM 1.3.3)
# Filled following glossary-ja.md. Human proofreading: edit work/openEHR-EHR-OBSERVATION.story.v1.ja.tsv
# and run `make import ID=openEHR-EHR-OBSERVATION.story.v1` (regenerates this file).

T = {
  ['description', '-', 'purpose'] =>
    "ケア対象者の病歴を叙述的に記録し、症状、健康イベント、および関連する話題について構造化された詳細で叙述を補う詳細な CLUSTER archetype群を入れ子にするための枠組みを提供するため。\n\n本人、親、介護者、またはその他の関係者から報告された病歴の詳細を記録するために用いる。臨床医が報告を受けた病歴の記録の一部として記録することも、臨床質問票や個人健康記録の一部として本人が自ら記録することもある。",
  ['description', '-', 'use'] =>
    "ケア対象者の視点からの、健康に関する主観的な観察や印象についての記述を記録するために用いる。 \n\n医療提供の文脈で臨床医が記録する場合、ストーリーは、本人、親、介護者、またはその他の関係者から報告された病歴を捉えるために使える。本人が記録する場合は、症状や健康上の経験についての本人の「ストーリー」の記述として使え、医療従事者と共有したり、本人の個人健康記録に残したりするために用いることができる。\n\n用途：\n- 単純な叙述を記録する；および／または \n- 「詳細」SLOT に関連する CLUSTER archetypeを含めることで、詳細な構造化された病歴を記録できるようにするコンテナarchetypeとして。例：CLUSTER.symptom、CLUSTER.issue、CLUSTER.health_event の各archetypeをこの SLOT で適切に使用できる。\n\n既存または旧来の臨床システムから取り込んだ病歴の叙述的な記述を、「ストーリー」テキストデータエレメントを用いて archetype化された形式に組み込むために用いる。",
  ['description', '-', 'misuse'] =>
    '臨床医による正式なアセスメントを記録するために用いてはならない。それらは通常、EVALUATION クラスのarchetypeを用いて記録する。',
  ['description', '-', 'keywords'] => '病歴 | 現病歴 | 主訴 | ストーリー | 症状 | 健康 | 記録 | 既往歴 | アナムネーゼ | 問診',
  ['description', '-', 'copyright'] => '© openEHR Foundation',

  ['term', 'at0000', 'text'] => 'ストーリー・病歴',
  ['term', 'at0000', 'description'] => 'ケア対象者の主観的な病歴で、本人が直接記録したもの、または本人や介護者から臨床医に報告されたもの。',

  ['term', 'at0001', 'text'] => 'Event Series',
  ['term', 'at0001', 'description'] => '@ internal @',

  ['term', 'at0002', 'text'] => '任意のイベント',
  ['term', 'at0002', 'description'] => '既定の、特定されていない時点または期間のイベント。テンプレートまたは実行時に明示的に定義できる。',

  ['term', 'at0003', 'text'] => 'Tree',
  ['term', 'at0003', 'description'] => '@ internal @',

  ['term', 'at0004', 'text'] => 'ストーリー',
  ['term', 'at0004', 'description'] => 'ケア対象者のストーリーまたは病歴の叙述的な記述。',

  ['term', 'at0006', 'text'] => '構造化された詳細',
  ['term', 'at0006', 'description'] => '本人のストーリーまたは患者の病歴についての構造化された詳細。',
  ['term', 'at0006', 'comment'] => '例：悪心や疼痛のような特定の症状；自転車からの転落のようなイベント；禁煙したいという希望のような問題。',

  ['term', 'at0007', 'text'] => 'Tree',
  ['term', 'at0007', 'description'] => '@ internal @',

  ['term', 'at0008', 'text'] => 'Extension',
  ['term', 'at0008', 'description'] => 'ローカルコンテンツを捕捉するため、あるいは他の参照モデルや形式手法と整合させるために必要な追加情報。',
  ['term', 'at0008', 'comment'] => '例：ローカルな情報要件や、FHIR の相当するものに適合させるための追加メタデータ。',
}.freeze

# note 列に残すメモ。迷った訳語には '要確認: ...' を付ける。
NOTES = {
  ['term', 'at0000', 'text'] => '要確認: 「ストーリー・病歴」を採用（他候補: 病歴／経過（targets.tsv の案）、病歴・ストーリー、病歴）。Story は本人の語りという原義を残すためカタカナ、History は「病歴」。区切りは problem_diagnosis に倣い「・」',
  ['term', 'at0001', 'text'] => '要確認: Event Series は HISTORY の内部ノード名（description が @ internal @）なので Tree / List / History と同じく英字のまま。訳すなら「イベントシリーズ」',
  ['term', 'at0002', 'text'] => '要確認: 「任意のイベント」を採用（他候補: いずれかのイベント、任意イベント）。他の OBSERVATION でも共通の値になるので用語集に登録',
  ['term', 'at0004', 'text'] => '要確認: 「ストーリー」を採用（他候補: 病歴、叙述）。概念名との対応を優先',
  ['term', 'at0006', 'text'] => '要確認: 「構造化された詳細」を採用（用語集 structured body site＝構造化された身体部位表現 に合わせた）',
  ['term', 'at0008', 'description'] => '要確認: Extension の description / comment は problem_diagnosis 校正版（at0071）の文言に合わせた。用語集の reference models/formalisms＝参照モデル／形式体系 とは表現が異なるため用語集側を更新',
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
