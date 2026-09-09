# frozen_string_literal: true
# Fills the target column of request.v1.tsv with the reviewed Japanese text.
# Kept as a script so the translation is reproducible and diffable.

T = {
  ['description', '-', 'purpose'] =>
    'ケア対象者について、医療従事者または医療機関に対し、助言、特定のサービス、または診療の移管を依頼するため。',
  ['description', '-', 'use'] =>
    "ケア対象者について、医療従事者または医療機関に対し、助言、サービス、または診療の移管を依頼する際の基盤として用いる。この文書には通常、依頼の範囲および有効期間に関する詳細と、ケア対象者に関する関連する臨床情報が含まれる。依頼の内容は、単純なコンサルテーションの依頼、今後の対応についての推奨を求めるもの、特定の処置や臨床検査の依頼から、受け手となる医療従事者への診療および臨床的責任の完全な引き継ぎまで多岐にわたる。\n\nユースケースには以下の依頼が含まれるが、これらに限定されない：\n- 専門医によるコンサルテーション、セカンドオピニオン、または診療方針に関する助言；\n- 臨床検査；\n- 訪問看護師による在宅ケア；\n- リハビリテーション施設への診療の移管；\n- 高齢者ケアのアセスメント；\n- 薬剤師による薬剤監査；および\n- 理学療法または作業療法の提供。\n\n依頼は、依頼を実施する特定の医療従事者または医療機関を指定するもの（宛先指定あり）でも、希望するケアの種類のみを示すもの（宛先指定なし）でもよい。",
  ['description', '-', 'misuse'] =>
    "単一の診察の一部として記録される文書を表現するために用いてはならない。その目的にはCOMPOSITION.encounterを用いること。\n\n他の医療機関または医療従事者への診療移管サマリーを提供するために用いてはならない。その目的にはCOMPOSITION.transfer_summaryを用いること。",
  ['description', '-', 'keywords'] => '紹介 | 依頼 | サービス | 紹介状 | 診療依頼',
  ['description', '-', 'copyright'] => '© openEHR Foundation',
  ['term', 'at0000', 'text'] => '診療依頼書',
  ['term', 'at0000', 'description'] =>
    '助言、サービス、または診療の移管を依頼する目的で、診療を担当する医療従事者または医療機関から別の医療従事者・医療機関へ送付される文書。',
  ['term', 'at0001', 'text'] => 'Tree',
  ['term', 'at0001', 'description'] => '@ internal @',
  ['term', 'at0042', 'text'] => 'Extension',
  ['term', 'at0042', 'description'] =>
    'ローカルな文脈を取り込むため、または他の参照モデル／形式体系と整合させるために必要な追加情報。',
  ['term', 'at0042', 'comment'] =>
    '例：院内の部門情報や、FHIRまたはCIMIの等価物と整合させるための追加メタデータ。'
}.freeze

NOTES = {
  ['term', 'at0000', 'text'] => '「診療依頼書」を採用（他候補: 依頼書／サービス依頼）。国内の「診療情報提供書」とは区別',
  ['term', 'at0001', 'text'] => '内部ノード。他言語（de/sv/nb/nl）に倣い "Tree" のまま',
  ['description', '-', 'use'] => '要確認: "aged care assessment"→「高齢者ケアのアセスメント」（介護認定と読み替えず直訳）、"subject of care"→「ケア対象者」',
  ['term', 'at0042', 'text'] => '用語集の決定により "Extension" は訳さず英字のまま',
  ['description', '-', 'keywords'] => '原文3語に「紹介状」「診療依頼」を追加（CKM検索性のため）'
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
