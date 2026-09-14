# frozen_string_literal: true
# Japanese translation for openEHR-EHR-CLUSTER.person.v1 (CKM 1.0.5)
# Filled following glossary-ja.md and the MML4 vocabulary (doc/MML4 in skoba/mml).
# Human proofreading: edit work/openEHR-EHR-CLUSTER.person.v1.ja.tsv and run
# `make import ID=openEHR-EHR-CLUSTER.person.v1` (regenerates this file).

T = {
  ['description', '-', 'purpose'] =>
    '臨床記録の過程で把握または理解されたとおりに、人についての詳細を記録するため。',
  ['description', '-', 'use'] =>
    "臨床記録の過程で把握または理解されたとおりに人の詳細を記録するために用いる。多くはその場限りの記録であるか、正式なデモグラフィック登録簿やインデックスを使うことが適切でない、または不可能な場合である。例：\n- EVALUATION.advance_care_directive archetypeの「写し保持者」SLOT を用いた、事前ケア記録の写しの保持者；\n- CLUSTER.organisation archetypeの「連絡担当者」SLOT を用いた、組織内で名前が特定された連絡担当者の役割と連絡先；\n- openEHR-EHR-EVALUATION.family_history archetypeの「家族構成員の詳細」SLOT を用いた、家族歴記録における親族の詳細； \n- CLUSTER.specimen archetypeの「検体採取者の詳細」を用いた、患者から臨床検査の検体を採取した人の氏名；または\n- CLUSTER.health_event archetypeの「目撃者」SLOT を用いた、転倒や事故の目撃者。\n\nほとんどの単純な臨床記録のユースケースでは、CLUSTER.person archetype内の非構造化の「氏名」要素だけで、健康記録の一部として人の氏名を記録するのに十分である。しかし、臨床記録の目的で構造化された氏名が必要または望ましい状況では、本archetypeを CLUSTER.person archetypeの「構造化された氏名」SLOT に入れ子にする。CLUSTER.structured_name archetypeを「構造化された氏名」SLOT に入れ子にした場合、そのデータエレメントの一部またはすべてをテキスト文字列として結合し、「氏名」要素に表すことができる。ただし両者が整合していること。\n\n本archetypeは、領域の専門家とテンプレートをレビューする際に、正式なデモグラフィックデータの代用としても使える。例えば、アセスメント様式の冒頭に人の詳細が表示されることをレビュー担当者が期待するようなアセスメントである。",
  ['description', '-', 'misuse'] =>
    "正式な識別管理を表したり置き換えたりするため、あるいは公式のデモグラフィック登録簿やインデックスを維持する目的で用いてはならない。その目的には正式な患者マスターインデックス（MPI）や医療従事者インデックス、または openEHR デモグラフィック情報モデルに基づくarchetypeを用いること。\n\nケア対象者、参加者、記録の作成者など、参照モデルの属性を用いて健康記録に正式に表すべきデータエレメントを表すために用いてはならない。\n\n個人の生年月日を記録するために用いてはならない。その目的には EVALUATION.birth_summary 内の「生年月日」データエレメントを用いること\n\n個人の生体認証情報やバイオマーカーを記録するために用いてはならない。その目的には専用の ENTRY archetypeを用いること。",
  ['description', '-', 'keywords'] => '医療提供者 | 介護者 | 職員 | 医療従事者 | 親族 | 近親者 | 医師 | 目撃者 | 友人 | 隣人 | 子 | 家族 | きょうだい | 親 | 個人 | 人 | 氏名 | 連絡先',
  ['description', '-', 'copyright'] => '© openEHR Foundation',

  ['term', 'at0000', 'text'] => '人',
  ['term', 'at0000', 'description'] => '一人の人間。',

  ['term', 'at0001', 'text'] => '氏名',
  ['term', 'at0001', 'description'] => 'その人の非構造化の氏名。',
  ['term', 'at0001', 'comment'] => 'このデータエレメントの内容は、CLUSTER.structured_name の1つ以上の構成要素をテキスト文字列として結合して導いてもよい。例：「John Markham」、「Professor Sir John Markham」、「John Markham Jnr MP」。',

  ['term', 'at0002', 'text'] => '構造化された氏名',
  ['term', 'at0002', 'description'] => 'その人の完全な氏名を、個別の構造化された構成要素に分けて表す代替の表現。',
  ['term', 'at0002', 'comment'] => '構造化された氏名の要素の一部またはすべてをテキスト文字列として結合し、本archetypeの「氏名」データエレメントに表すことができる。',

  ['term', 'at0003', 'text'] => '識別子',
  ['term', 'at0003', 'description'] => 'その人に関連付けられた識別子。',
  ['term', 'at0003', 'comment'] => 'このデータエレメントの出現回数は 0..* に設定されており、複数の識別子を記録できる。DV_IDENTIFIER データ型には、ID の値、種類、発行者、割り当て先を記録する複数の下位要素がある点に注意。例：社会保障番号；運転免許証；またはパスポート番号。',

  ['term', 'at0004', 'text'] => '役割',
  ['term', 'at0004', 'description'] => '健康記録の対象者に対するその人の関係または役割。',
  ['term', 'at0004', 'comment'] => '例：事前ケア記録の写し保持者；組織の連絡担当者；家族歴の項目における親族；検体採取者；または転倒や事故の目撃者。本archetypeで記述する人が健康記録の対象者自身である場合、このデータエレメントは冗長になる。',

  ['term', 'at0005', 'text'] => '住所',
  ['term', 'at0005', 'description'] => 'その人の住所についての詳細。',

  ['term', 'at0006', 'text'] => '電子的連絡先',
  ['term', 'at0006', 'description'] => 'その人の1つ以上の種類の電子的連絡先についての詳細。',

  ['term', 'at0007', 'text'] => '組織',
  ['term', 'at0007', 'description'] => 'その人の組織上の文脈についての詳細。',
  ['term', 'at0007', 'comment'] => '例：その人の「役割」に関連する事業組織や地域組織の特定。',

  ['term', 'at0008', 'text'] => '追加の詳細',
  ['term', 'at0008', 'description'] => 'その人についての追加の詳細。',

  ['term', 'at0009', 'text'] => '写真',
  ['term', 'at0009', 'description'] => 'その人の写真。',

  ['term', 'at0010', 'text'] => 'コメント',
  ['term', 'at0010', 'description'] => '他の項目では捉えられない、その人についての追加の記述。',

  ['term', 'at0011', 'text'] => 'ラベル',
  ['term', 'at0011', 'description'] => 'その人に付けるラベル。',
  ['term', 'at0011', 'comment'] => '例：「赤い扉の家の隣人」。',
}.freeze

# note 列に残すメモ。迷った訳語には '要確認: ...' を付ける。
NOTES = {
  ['term', 'at0000', 'text'] => '要確認: 概念名「人」を採用（targets.tsv の案。他候補: 個人、人物）。MML4 の「個人情報形式（PersonalizedInfo）」は個人だが、本 archetype は subject 以外の人一般を指すので「人」',
  ['term', 'at0001', 'text'] => '要確認: Name＝「氏名」（MML4 人名表現形式／個人情報形式の「氏名」に合わせた。他候補: 名前）',
  ['term', 'at0002', 'text'] => '要確認: 「構造化された氏名」（用語集 structured …＝構造化された…）。CLUSTER.structured_name の概念名は #8 で確定',
  ['term', 'at0003', 'text'] => '要確認: Identifier＝「識別子」（用語集 order identifier＝オーダー識別子 に合わせた。MML4 の Id 形式は「ID」）',
  ['term', 'at0004', 'text'] => '要確認: Role＝「役割」（他候補: 続柄・役割、関係）。description は「関係または役割」',
  ['term', 'at0006', 'text'] => '要確認: Electronic communication＝「電子的連絡先」（targets.tsv #10 の案。MML4 では電子メールアドレス・電話番号）',
  ['term', 'at0007', 'text'] => '要確認: Organisation（スロット）＝「組織」（用語集 organisation＝医療機関/組織/部門。ここは医療機関に限らないので「組織」。MML4 の施設情報形式＝施設 は organisation.v1 で検討）',
  ['term', 'at0011', 'text'] => '要確認: Label＝「ラベル」',
  ['description', '-', 'use'] => '要確認: 未訳 archetype のスロット名は仮訳（Copyholder＝写し保持者、Contact person＝連絡担当者、Family member details＝家族構成員の詳細、Specimen collector details＝検体採取者の詳細、Witness＝目撃者）。該当 archetype の翻訳時に揃える。demographic register/index＝デモグラフィック登録簿／インデックス',
  ['description', '-', 'misuse'] => '要確認: Master Patient Index＝患者マスターインデックス（MPI）、Health Provider Index＝医療従事者インデックス、Demographic Information Model＝デモグラフィック情報モデル、biometric detail＝生体認証情報',
  ['description', '-', 'keywords'] => '要確認: 原文はカンマ区切りの 1 語だが、CKM 検索用に語ごとに分けた。practitioner→医師、next-of-kin→近親者、sibling→きょうだい。「人」「氏名」「連絡先」を追加',
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
