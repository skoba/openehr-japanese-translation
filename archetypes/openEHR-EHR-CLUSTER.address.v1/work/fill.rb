# frozen_string_literal: true
# Japanese translation for openEHR-EHR-CLUSTER.address.v1 (CKM 1.1.3)
# Filled following glossary-ja.md, the MML4 住所表現形式 vocabulary and docs/localisation-ja.md
# (Japanese counterparts go into comments as examples; labels keep the international meaning).
# Human proofreading: edit work/openEHR-EHR-CLUSTER.address.v1.ja.tsv and run
# `make import ID=openEHR-EHR-CLUSTER.address.v1` (regenerates this file).

T = {
  ['description', '-', 'purpose'] =>
    '臨床記録の作成に際して把握または理解された、人、建物、または目印となる場所の所在についての詳細を記録するため。',
  ['description', '-', 'use'] =>
    "臨床記録の作成に際して把握または理解された、人、建物、または目印となる場所の所在についての詳細を記録するために用いる。多くはその場限りの記録であるか、住所検索サービスを使うことが適切でない、または不可能な場合である。例：\n- 個人に在宅ケアを提供する組織の事業所住所；または\n- EVALUATION.advance_care_directive archetype内の、事前ケア記録の写し保有者の郵送先住所；または\n- 転倒や事故が起きた物理的な場所。\n\n本archetypeの範囲は、特定の建物や目印となる場所を識別するための最も一般的な構造化された構成要素に限定している。この文脈では、完全な住所は次の要素で記述できる：\n- 「街区レベル」の詳細を記録する必要のある非常に多様な方法を表すための、1つ以上の自由記述の「住所行」データエレメント；および\n- 郊外、町、市、村、または地域社会を表す「市区町村」；\n- 地方自治体の区域を表す「地区／郡」；\n- 主要な行政区域を表す「都道府県／州」；\n- 「郵便番号」；および \n- 「国」。\nただし、「構造化された住所」SLOT に CLUSTER.structured_address を入れ子にすることで、住所についてより細かな詳細を含めるよう本archetypeを拡張できる。\n\n本 CLUSTER.address archetypeは、領域の専門家とテンプレートをレビューする際に、正式なデモグラフィック住所データの住所の代用としても使える。例えば、アセスメント様式の冒頭に個人の完全な連絡先が表示されることをレビュー担当者が期待するようなアセスメントである。",
  ['description', '-', 'misuse'] =>
    "ISO 規格に記述されているような、または公式のデモグラフィック登録簿やインデックスの維持の一部としての、完全に構造化された住所を記録するために用いてはならない。その目的には住所検索サービス、正式な患者マスターインデックス（MPI）や医療従事者名簿（Health Provider Index）、または openEHR デモグラフィック情報モデルに基づくarchetypeを用いること。\n\n電子的な連絡先に用いるデジタルアドレスを表すために用いてはならない。その目的には CLUSTER.electronic_communication を用いること。\n\n住居やホームレス状態についての詳細を記録するために用いてはならない。その目的には EVALUATION.housing_summary を用いること。",
  ['description', '-', 'keywords'] => '住所 | 郵便 | 郵送先 | 自宅 | 勤務先 | 事業所 | 所在地 | 目印 | 都道府県 | 市区町村 | 郵便番号',

  ['term', 'at0000', 'text'] => '住所',
  ['term', 'at0000', 'description'] => '人、建物、または目印となる場所の所在についての詳細。',

  ['term', 'at0001', 'text'] => '住所行',
  ['term', 'at0001', 'description'] => '場所の識別を支える、街区レベルまたは私書箱の関連する詳細をすべて表す非構造化の住所行。',
  ['term', 'at0001', 'comment'] => 'このデータエレメントの出現回数は 0..* に設定されており、指定した「市区町村」の中で「街区レベル」の詳細を記録する必要のある非常に多様な方法を、1つ以上の自由記述の「住所行」データエレメントで表せる。複数の住所行はテンプレートで「住所行 1」「住所行 2」などと名前を変えて表せる。例：「7A/52 Davis Street」、または住所行 1 を「Apartment 7A」とし住所行 2 を「52 Davis Street」とする；「RMB 725, Princes Highway」のような路上郵便受けの場所；あるいは「Corner of Smith & Brown Streets」や「Second house north of the general store with the red door」のような説明的な目印。日本の住所では、町域・丁目・番地・号・建物名・部屋番号（例：「本町一丁目2番3号 ○○ビル 401」）をここに記録する。',

  ['term', 'at0002', 'text'] => '市区町村',
  ['term', 'at0002', 'description'] => '住所を含む最下位の地域の名称。',
  ['term', 'at0002', 'comment'] => '例：郊外、町、市、集落、村、または地域社会。可能であれば、外部用語集によりコード化することが望ましい。例：「Fitzroy」；「Manchester」；「Kingston」または「Bergen」。日本の住所では市区町村（政令指定都市では市と区）が該当し、JIS X 0402 の全国地方公共団体コードでコード化できる。',

  ['term', 'at0003', 'text'] => '地区／郡',
  ['term', 'at0003', 'description'] => '住所を含む地方自治体の区域または地理的区域の名称。',
  ['term', 'at0003', 'comment'] => '可能であれば、外部用語集によりコード化することが望ましい。例：オーストラリア・ビクトリア州の地方自治体「Surf Coast」と「Yarra」；ジャマイカの教区「Saint Andrew」と「Kingston」。日本の住所では、町村の場合の郡が該当する（政令指定都市の区は「市区町村」側に記録する）。',

  ['term', 'at0004', 'text'] => '都道府県／州',
  ['term', 'at0004', 'description'] => '住所を含む主要な行政区域または地理的区域の名称。',
  ['term', 'at0004', 'comment'] => '可能であれば、外部用語集によりコード化することが望ましい。例：オーストラリアの「New South Wales」と「Queensland」；カナダの「British Columbia」と「Nova Scotia」；ジャマイカの「Cornwall」「Middlesex」「Surrey」の各カウンティ。日本の住所では都道府県が該当し、JIS X 0401 の都道府県コードでコード化できる。',

  ['term', 'at0005', 'text'] => '郵便番号',
  ['term', 'at0005', 'description'] => '該当する郵便配達サービスが定める、住所を含む郵便配達区域のコード。',
  ['term', 'at0005', 'comment'] => "ポストコードや ZIP コードとも呼ばれる。日本の郵便番号は 7 桁（例：100-0001）。\n",

  ['term', 'at0006', 'text'] => '国',
  ['term', 'at0006', 'description'] => '住所を含む国の名称。',
  ['term', 'at0006', 'comment'] => '例：オーストラリア；カナダ；ジャマイカ；またはノルウェー。EN ISO 3166-1 の 2 文字国コードのような外部用語集によるコード化を推奨する（日本は JP）。',

  ['term', 'at0007', 'text'] => '緯度',
  ['term', 'at0007', 'description'] => '住所の地理的位置の水平（y）座標。',
  ['term', 'at0007', 'comment'] => '緯度は赤道以北を正の値、赤道以南を負の値で表す。例：エッフェル塔の緯度は 48.858093。',

  ['term', 'at0008', 'text'] => '経度',
  ['term', 'at0008', 'description'] => '住所の地理的位置の水平（x）座標。',
  ['term', 'at0008', 'comment'] => '経度は本初子午線以西を負の値、本初子午線以東を正の値で表す。例：エッフェル塔の経度は 2.294694。',

  ['term', 'at0009', 'text'] => '高度',
  ['term', 'at0009', 'description'] => '住所の高さまたは深さを表す、地理的位置の垂直座標。',
  ['term', 'at0009', 'comment'] => '例：エッフェル塔の頂上の高度は +324 m。',

  ['term', 'at0010', 'text'] => '種別',
  ['term', 'at0010', 'description'] => '住所の種別。',
  ['term', 'at0010', 'comment'] => '例：物理的所在地または郵送先。',
  ['term', 'at0011', 'text'] => '物理的所在地',
  ['term', 'at0011', 'description'] => '訪問できる物理的な場所。',
  ['term', 'at0012', 'text'] => '郵送先',
  ['term', 'at0012', 'description'] => '手紙や小包の郵送先として使う住所。',
  ['term', 'at0013', 'text'] => '両方',
  ['term', 'at0013', 'description'] => '物理的な場所の住所で、郵送先としても使うもの。',

  ['term', 'at0014', 'text'] => '用途',
  ['term', 'at0014', 'description'] => '住所の主な目的または用途。',
  ['term', 'at0015', 'text'] => '事業所',
  ['term', 'at0015', 'description'] => '事業所や事務所の物理的な場所の住所。',
  ['term', 'at0016', 'text'] => '自宅',
  ['term', 'at0016', 'description'] => '人が常時居住している場所の住所。',
  ['term', 'at0017', 'text'] => '一時滞在先',
  ['term', 'at0017', 'description'] => '人が一時的に居住している場所の住所。',

  ['term', 'at0018', 'text'] => 'コメント',
  ['term', 'at0018', 'description'] => '他の項目では捉えられない、住所についての追加の記述。',

  ['term', 'at0019', 'text'] => '地図 URL',
  ['term', 'at0019', 'description'] => 'オンライン地図上の場所へのリンク。',
  ['term', 'at0019', 'comment'] => '例：Google マップや iOS のマップ上の場所。',

  ['term', 'at0020', 'text'] => '構造化された住所',
  ['term', 'at0020', 'description'] => '住所の構造化された詳細または拡張。',
  ['term', 'at0020', 'comment'] => '例：構造化された細かな粒度の住所を表す、または一貫した方法で単一の「住所行」を組み立てるために連結できる標準化された概念として使う。日本の住所では、都道府県・市区町村・町域・丁目・番地・号・建物名・部屋番号とそれぞれの読みを持つ CLUSTER をここに入れる想定。',

  ['term', 'at0021', 'text'] => '位置情報コード',
  ['term', 'at0021', 'description'] => '正確な地理的位置を表す一意の識別子。',
  ['term', 'at0021', 'comment'] => 'ジオコードとも呼ばれる。例：経度、緯度、±高度を連結した GPS 座標；Open Location Code または Plus Code；ユニバーサル横メルカトル（UTM）；および geohash。',
}.freeze

# note 列に残すメモ。迷った訳語には '要確認: ...' を付ける。
NOTES = {
  ['term', 'at0001', 'text'] => '要確認: Address line＝「住所行」を採用（他候補: 住所（行）、番地以下）。comment 末尾に日本の住所での対応（町域〜部屋番号を 1 行）を例示として追加（localisation-ja.md）',
  ['term', 'at0002', 'text'] => '要確認: City/Town＝「市区町村」（localisation-ja.md の対応表。MML4 city＝市・区・郡、town＝町・村 とは区切りが違う）。comment に政令指定都市の扱いと JIS X 0402 を追加',
  ['term', 'at0003', 'text'] => '要確認: District/County＝「地区／郡」（他候補: 郡／地区、郡）。日本では町村の郡のみ該当',
  ['term', 'at0004', 'text'] => '要確認: State/Territory/Province＝「都道府県／州」を採用（日本の対応物を先に置いた。他候補: 州／準州／県、州・県）。comment に JIS X 0401 を追加',
  ['term', 'at0005', 'text'] => '「郵便番号」（MML4 zip）。comment に 7 桁の例を追加',
  ['term', 'at0010', 'text'] => '要確認: Type＝「種別」、値 Physical／Postal／Both＝「物理的所在地／郵送先／両方」（他候補: 所在地／郵送用／両用）',
  ['term', 'at0014', 'text'] => '要確認: Use＝「用途」、値 Business／Residential／Temporary accommodation＝「事業所／自宅／一時滞在先」（MML4 住所の種類 business＝勤務先、home＝自宅 を参考。他候補: 勤務先／居住地／一時的な宿泊先）',
  ['term', 'at0019', 'text'] => '要確認: Map URL＝「地図 URL」',
  ['term', 'at0020', 'text'] => '要確認: Structured address（スロット）＝「構造化された住所」。comment 末尾に日本の構造化住所 CLUSTER（structured_address_jp、localisation-ja.md）を入れる想定を追加',
  ['term', 'at0021', 'text'] => '要確認: Geolocation code＝「位置情報コード」、geocode＝「ジオコード」（他候補: 地理位置コード、ジオロケーションコード）',
  ['description', '-', 'use'] => '要確認: address lookup service＝住所検索サービス、street-level＝街区レベル、landmark＝目印となる場所。misuse の housing or homelessness＝住居やホームレス状態',
  ['description', '-', 'keywords'] => '要確認: 原文 7 語（住所、郵便、郵送先、自宅、勤務先、所在地、目印）に「事業所」「都道府県」「市区町村」「郵便番号」を追加',
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
