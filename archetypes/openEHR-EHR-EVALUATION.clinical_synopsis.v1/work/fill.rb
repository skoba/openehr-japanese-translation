# frozen_string_literal: true
# Japanese translation for openEHR-EHR-EVALUATION.clinical_synopsis.v1 (CKM 1.0.5)
# Filled following glossary-ja.md. Human proofreading: edit work/openEHR-EHR-EVALUATION.clinical_synopsis.v1.ja.tsv
# and run `make import ID=openEHR-EHR-EVALUATION.clinical_synopsis.v1` (regenerates this file).

T = {
  ['description', '-', 'purpose'] =>
    '医療従事者の視点から、患者についての叙述的な要約を手作業で総合して記録するため。',
  ['description', '-', 'use'] =>
    "患者の健康についての叙述的で要約的な見方を記録するために用いる。この非構造化の要約には、特定された健康上の問題、提供された医療、関連する解釈、患者の理解を含めることができ、患者の経験と経過のうち、より柔らかく主観的な側面についての伝達を可能にする。この要約はほとんどの場合、特定の診察や入院のような特定の健康イベントに関連するものになると考えられるが、さまざまな期間にわたる患者の健康上の経験を要約するためにも使える。 \n実際には、臨床要約は既存の構造化された臨床記録を補完するメタ観察であり、構造化データだけでは明らかにならないかもしれない、患者についての微妙で主観的または解釈的な情報を表現できるようにし、EHR の記録にバランスと文脈を与える。 \n例えば、臨床要約は、包括的で構造化された退院時サマリー文書の一構成要素として、患者の入院についての簡潔な要約を伝えることができる。",
  ['description', '-', 'misuse'] =>
    "特定の構造化された健康情報を記録するために用いてはならない。例えば、プロブレム、診断、検査結果についての詳細な情報は、それぞれに対応する EVALUATION.problem、EVALUATION.problem-diagnosis、および OBSERVATION の臨床検査や放射線検査の結果の各archetypeを用いて記録すべきである。臨床要約は、要約の完全性のために重要と判断される場合には、これらの構造化された詳細の中から重要で選択された数値結果を伝えてもよいが、それらの主たる記録場所ではない。\n「臨床要約（Clinical Synopsis）」という語は、退院時サマリーや報告書のような複雑で包括的な文書を指すこともある。openEHR では、これらの文書は制約されたarchetypeの集合、すなわち複数の独立したarchetypeからなる退院時サマリーのテンプレートや報告書のテンプレートとして表現されるべきであり、本臨床要約archetypeはその一つになりうる。",
  ['description', '-', 'keywords'] => '要約 | 結論 | 概要 | 大意 | 抄録 | アセスメント | サマリー | エピクリーゼ | コメント | 記録 | 臨床要約 | 経過要約',
  ['description', '-', 'copyright'] => '© openEHR Foundation',

  ['term', 'at0000', 'text'] => '臨床要約',
  ['term', 'at0000', 'description'] => '患者についての叙述的な要約または概観で、特に医療従事者の視点からのもの。関連する解釈を伴う場合も伴わない場合もある。',

  ['term', 'at0001', 'text'] => 'List',
  ['term', 'at0001', 'description'] => '@ internal @',

  ['term', 'at0002', 'text'] => '要約',
  ['term', 'at0002', 'description'] => '臨床所見の要約、アセスメント、結論、または評価。',

  ['term', 'at0003', 'text'] => 'Tree',
  ['term', 'at0003', 'description'] => '@ internal @',

  ['term', 'at0004', 'text'] => 'Extension',
  ['term', 'at0004', 'description'] => 'ローカルコンテンツを捕捉するため、あるいは他の参照モデルや形式手法と整合させるために必要な追加情報。',
  ['term', 'at0004', 'comment'] => '例：ローカルな情報要件や、FHIR または CIMI の相当するものに適合させるための追加メタデータ。',
}.freeze

# note 列に残すメモ。迷った訳語には '要確認: ...' を付ける。
NOTES = {
  ['term', 'at0000', 'text'] => '要確認: 「臨床要約」を採用（targets.tsv の案。他候補: 臨床サマリー、臨床的総括）。Discharge Summary＝退院時サマリー とは語を分けた',
  ['term', 'at0002', 'text'] => '要確認: Synopsis 単独は「要約」（他候補: 総括）',
  ['description', '-', 'keywords'] => '要確認: epicrisis→「エピクリーゼ」（他候補: 退院時総括）、precis→「大意」、abstract→「抄録」。原文 10 語に「臨床要約」「経過要約」を追加',
  ['description', '-', 'use'] => '要確認: meta observation→「メタ観察」、patient’s experience and journey→「患者の経験と経過」、softer, more subjective aspects→「より柔らかく主観的な側面」',
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
