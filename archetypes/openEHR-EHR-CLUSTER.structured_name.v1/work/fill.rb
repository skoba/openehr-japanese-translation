# frozen_string_literal: true
# Japanese translation for openEHR-EHR-CLUSTER.structured_name.v1 (CKM 1.0.3)
# Filled following glossary-ja.md and the MML4 人名表現形式 vocabulary (姓 / 名 / 敬称 / 学位).
# Human proofreading: edit work/openEHR-EHR-CLUSTER.structured_name.v1.ja.tsv and run
# `make import ID=openEHR-EHR-CLUSTER.structured_name.v1` (regenerates this file).

T = {
  ['description', '-', 'purpose'] =>
    '臨床記録の過程で把握または理解されたとおりに、個人の構造化された氏名の詳細を記録するため。',
  ['description', '-', 'use'] =>
    "臨床記録の過程で把握または理解されたとおりに個人の構造化された氏名の詳細を記録するために用いる。多くはその場限りの記録であるか、正式なデモグラフィック登録簿やインデックスを使うことが適切でない、または不可能な場合である。\n\nほとんどの単純な臨床記録のユースケースでは、CLUSTER.person archetype内の非構造化の「氏名」要素だけで、健康記録の一部として個人の氏名を記録するのに十分である。しかし、臨床記録の目的で構造化された氏名が必要または望ましい状況では、本archetypeを CLUSTER.person archetypeの「構造化された氏名」SLOT に入れ子にする。\n\n各データエレメントには自由記述の文字列を入力できる。例：「Prof Dr」、「Sonja Jane」、「Smith-Brown」、「MP」。あるいは、各データエレメントはテンプレート内で繰り返せるので：\n- 「敬称」を複製して、値「Prof」用の「敬称 1」と値「Dr」用の「敬称 2」にできる；および\n-  「名」を複製して名前を変え、値「Sonja」用の「ファーストネーム」と値「Jane」用の「ミドルネーム」にできる。\n\n本archetypeは ISO 22220 に合わせているが、通称（preferred name）、氏名の用途、有効期間、および繰り返しの氏名構成要素／順序のグループ化は、本archetypeの範囲を限定するため意図的に再現していない。\n\n本archetypeが設計されたほとんどのユースケースでは、複雑な姓は単に文字列として記録されると想定している。しかし、ISO 22220:2007（Annex F）の指針と例に従い、この構造化された氏名のパターンの中でより細かく記録することもできる。例：\n- 姓を先、名を後に置く；\n- El Haddad や van der Heyden のような接頭辞付きの姓；および\n- 父方と母方の両方の姓を含む氏名。",
  ['description', '-', 'misuse'] =>
    "個人の氏名を表す非構造化のテキスト文字列で目的に足りる場合には用いてはならない。その目的には CLUSTER.person 内の「氏名」データエレメントを用いること。\n\n通称、氏名の用途、使用の有効期間のような複雑な氏名の表現や管理のために用いてはならない。その目的には正式な患者マスターインデックス（MPI）や医療従事者名簿（Health Provider Index）、または openEHR デモグラフィック情報モデルに基づくarchetypeを用いること。\n\n正式な識別管理を表したり置き換えたりするため、あるいは公式のデモグラフィック登録簿やインデックスを維持する目的で用いてはならない。その目的には正式な患者マスターインデックス（MPI）や医療従事者名簿（Health Provider Index）、または openEHR デモグラフィック情報モデルに基づくarchetypeを用いること。\n\nケア対象者、参加者、記録の作成者など、参照モデルの属性を用いて健康記録に正式に表すべきデータエレメントを表すために用いてはならない。",
  ['description', '-', 'keywords'] => '人 | 個人 | 氏名 | 姓 | 名 | 構造化された氏名 | ふりがな',
  ['description', '-', 'copyright'] => '© openEHR Foundation',

  ['term', 'at0000', 'text'] => '人の構造化された氏名',
  ['term', 'at0000', 'description'] => '個人の氏名の個別の構成要素。',

  ['term', 'at0001', 'text'] => '敬称',
  ['term', 'at0001', 'description'] => '氏名の先頭に置く1つ以上の敬称や肩書き。',
  ['term', 'at0001', 'comment'] => 'このデータエレメントの出現回数は 0..* に設定されており、複数の敬称を記録できる。可能であれば、外部用語集によりコード化することが望ましい。例：「Doctor」；「Ms」；「Mx」；または「Professor Dr」。',

  ['term', 'at0002', 'text'] => '名',
  ['term', 'at0002', 'description'] => '家族集団の中で個人を識別するために用いる1つ以上の固有の名前。',
  ['term', 'at0002', 'comment'] => 'このデータエレメントの出現回数は 0..* に設定されており、複数の名を記録できる。加えて、特定のユースケースの必要に応じて、テンプレート内でこのデータエレメントを複製して名前を変え、「ファーストネーム」「ミドルネーム」「通称」「ニックネーム」のように種類の異なる名を個別に記録できる。日本語の氏名では「名」に当たる。ふりがな（カナ表記）を記録する場合は、テンプレートで本 CLUSTER をもう1つ占有して「氏名（カナ）」などと改名する。',

  ['term', 'at0005', 'text'] => '姓',
  ['term', 'at0005', 'description'] => '個人が家族集団と共有する1つ以上の名前。',
  ['term', 'at0005', 'comment'] => '「ラストネーム」または「サーネーム」とも呼ばれる。このデータエレメントの出現回数は 0..* に設定されており、複数の姓を記録できる。「El Haddad」や「van der Heyden」のような複雑な姓は、ISO 22220（Annex F）に示されるこの命名パターンで記録できるが、本archetypeが意図するユースケースでは、姓全体を文字列として記録することが最も多いと考えられる。日本語の氏名では「姓」に当たる。',

  ['term', 'at0006', 'text'] => '接尾辞',
  ['term', 'at0006', 'description'] => '他のすべての氏名構成要素の後に置く1つ以上の語。通常は、名と姓の構成要素が同一の家族構成員と個人を区別するために用いる。',
  ['term', 'at0006', 'comment'] => 'このデータエレメントの出現回数は 0..* に設定されており、複数の接尾辞を記録できる。可能であれば、外部用語集によりコード化することが望ましい。例：「Junior (Jr)」；「Senior (Sr)」；「Second (II)」。',
}.freeze

# note 列に残すメモ。迷った訳語には '要確認: ...' を付ける。
NOTES = {
  ['term', 'at0000', 'text'] => '要確認: 概念名「人の構造化された氏名」を採用（用語集 structured name＝構造化された氏名、person＝人。他候補: 構造化氏名（targets.tsv の案）、構造化された人名）',
  ['term', 'at0001', 'text'] => '要確認: Title＝「敬称」を採用（MML4 人名表現形式 prefix＝肩書き。他候補: 肩書き、称号）。Ms / Mx を含むので「敬称」',
  ['term', 'at0002', 'text'] => '要確認: Given name＝「名」、Family name＝「姓」（MML4 人名表現形式に合わせた。他候補: 名前／姓名）。comment 末尾にふりがなの扱い（テンプレートで本 CLUSTER をもう1つ占有）を日本向けの例示として追加（localisation-ja.md の翻訳層方針）',
  ['term', 'at0006', 'text'] => '要確認: Suffix＝「接尾辞」（他候補: サフィックス、接尾語）。MML4 の degree（学位）は Suffix で表す',
  ['description', '-', 'use'] => '要確認: preferred name＝通称、name usage＝氏名の用途、First name／Middle name＝ファーストネーム／ミドルネーム（MML4 middle＝ミドルネーム）',
  ['description', '-', 'keywords'] => '要確認: 原文 3 語（person, individual, name）に「姓」「名」「構造化された氏名」「ふりがな」を追加（CKM 検索用）',
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
