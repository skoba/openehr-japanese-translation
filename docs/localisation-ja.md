# 住所・人・氏名・機関名の日本語ローカライズ設計（2026-09-11）

翻訳（ja 訳の追加）だけでは済まない論点を、openEHR のどの層で扱うかを整理する。対象は CLUSTER.address.v1 / CLUSTER.person.v1 / CLUSTER.structured_name.v1（スプリント A 群 #7〜#9）。

## 三層の切り分け

| 層 | 扱うもの | 具体例 | 担当 |
|---|---|---|---|
| 翻訳層（CKM の ja 訳） | 要素名・定義の訳。日本の対応物は comment の例示で補う | State/Territory/Province の comment に「日本では都道府県」 | 翻訳スプリント |
| テンプレート層（jp_referral 等 OPT） | 表示順・改名・出現回数・値セット・書式注記 | 住所の表示順を大→小に、都道府県を JIS X 0401 の 47 値に制約、氏名 CLUSTER を 2 回占有して「氏名」「氏名（カナ）」と改名 | Anlage 側 |
| アーキタイプ層（新規 CLUSTER／CKM への変更要求） | 国際版に無いデータ要素 | 日本の構造化住所 CLUSTER（address.v1 の Structured address スロットに挿入）、structured_name.v1 への「表記種別」追加の CR | NPO openEHR Japan |

原則：国際アーキタイプの擬似特殊化（`-japan` 命名）はしない。新要素が要るときは、スロットに挿す新規 CLUSTER か、国際版への CR で解決する。

## 住所（CLUSTER.address.v1）

国際版の要素：Address line（非構造化の街区レベル 1 行）、City/Town、District/County、State/Territory/Province、Postal code、Country、緯度・経度・高度、Type（Physical/Postal/Both）、Use（Business/Residential/Temporary accommodation）、Comment、Map URL、**Structured address（スロット）**、Geolocation code。

日本の住所階層との対応（案）：

| 国際版要素 | 日本 | 備考 |
|---|---|---|
| Postal code | 郵便番号 | 7 桁、ハイフン有無の正規化はテンプレート注記 |
| State/Territory/Province | 都道府県 | 値セット 47（JIS X 0401 コード束縛） |
| District/County | 郡 | 町村のみ。政令市の区はここではなく City/Town 側 |
| City/Town | 市区町村（政令市は市＋区） | JIS X 0402 |
| Address line | 町域・丁目・番地・号・建物名・部屋番号を 1 行 | 非構造化の受け皿。構造化は下のスロットで |
| Structured address（スロット） | 日本の構造化住所 CLUSTER（新規） | 町域（大字・町名）／丁目／番地／号／建物名／部屋番号（方書）。デジタル庁アドレス・ベース・レジストリの階層に合わせる |
| Country | 国 | ISO 3166-1 JP |

表示順（大→小）、全角・半角、丁目の漢数字／算用数字は帳票側の書式規則としてテンプレート注記に置き、アーキタイプには持ち込まない。

**住所のふりがな（2026-09-11）**：日本の様式では住所にもフリガナ欄がある。データ源は郵便番号データ（KEN_ALL のカナ）とアドレス・ベース・レジストリ（都道府県・市区町村・町域の読み）。日本の構造化住所 CLUSTER は NPO 側の設計なので、最初から読みを持たせる。設計は二案：
- 案 A（対応要素）：都道府県／市区町村／町域の各要素に「…（カナ）」を並置する。郵便番号データからの自動補完と入力 UI が単純。番地以下（丁目・番地・号・建物名）は読みを持たない前提。
- 案 B（表記種別＋複数出現）：CLUSTER に「表記種別」（漢字／カナ／ローマ字）要素を置き、同じ CLUSTER を表記ごとに出現させる。氏名の Representation CR と同じ型で一貫し、ローマ字にも拡張できる。
Address line（非構造化 1 行）の読みは「住所（カナ）」として案 A の並置で受ける。

## 氏名（CLUSTER.structured_name.v1 / CLUSTER.person.v1）

structured_name.v1 の要素は Title / Family name / Given name / Suffix の 4 つだけで、**表記種別（漢字・かな・ローマ字）を表す要素が無い**。ふりがなはこのアーキタイプの翻訳では表現できない。

選択肢：

1. 当面（テンプレート層）：person.v1 の Structured name スロットに structured_name を 2 回占有し、「氏名」「氏名（カナ）」と改名する。抽出器が node name に依存しない方針との折り合いは、スロット内の出現順（1 番目＝漢字、2 番目＝カナ）と、テンプレート注記で担保する。
2. 本命（アーキタイプ層）：CKM に CR を出し、structured_name.v1 に「Representation（表記種別）」要素（値：ideographic／syllabic／alphabetic ほか）を追加してもらう。根拠は三つ。ISO 22220（ケア対象者識別）と ISO 21090 の EN.representation（IDE/SYL/ABC）に同じ概念があること、CKM の DEMOGRAPHIC-PARTY_IDENTITY.person_name.v0 が既に at0007 Alternative name representations／at0021 Representation usage／at0022 Alternative representation を持っていて EHR 側の CLUSTER に無いのは不整合であること、HL7 FHIR JP Core が HumanName に iso21090-EN-representation 拡張（IDE／SYL／ABC）を使っており、同じ軸を持てば FHIR ファサードの写像が無損失になること。中国語（拼音）・韓国語・タイ語・アラビア語圏にも共通の要件なので、国際版への追加として通りやすい。
3. 横断的な要件として扱う：ふりがなは人名だけでなく、住所（上記）と医療機関名（CLUSTER.organisation.v1 の Name。診療報酬関係の様式に医療機関名カナがある）にも要る。日本語では「名前らしい文字列」全般に読みが付く、という一般則なので、CR は structured_name.v1 単独ではなく「Representation（表記種別）」を名前系要素の共通概念として提案する（organisation.v1 の Name への追加、あるいは汎用の代替表記 CLUSTER）。RM の DV_TEXT.language に BCP 47 の script サブタグ（ja-Hani／ja-Kana／ja-Latn）を載せて複数出現で区別する方法もあるが、ツール側の対応が読めず、モデル上の明示（表記種別要素）の方が安全。
4. 補助：person.v1 の Name（非構造化）は「氏名（表記そのまま）」として残し、旧姓・通称は person_name.v0 の Maiden name／Other name 相当が EHR 側に無いため、必要になった時点で Additional details スロットか CR で扱う。

文字レベルの論点（外字・異体字は文字情報基盤 MJ 文字集合、ふりがなはひらがな／カタカナのどちらか、レセプト系の半角カナとの変換）は実装・運用ポリシーで、`docs/localisation-ja.md` として翻訳リポジトリに置き、アーキタイプには入れない。

## スプリントへの反映

- 翻訳層（このリポジトリの担当範囲）：#7〜#9 の comment に日本の対応物を例示として入れる（「例：都道府県」「例：市区町村」）。原文の意味は変えない。
- targets に「L 群（ローカライズ）」を別立てで置く：L1 日本の構造化住所 CLUSTER の設計（読みを含む。案 A／B の選択）、L2 名前系要素への表記種別 CR（structured_name.v1・organisation.v1。CKM Discourse／CR 起票）、L3 docs/localisation-ja.md（文字・書式ポリシー、ふりがなの仮名種別）、L4 jp_referral テンプレートでの住所表示順・氏名 2 回占有の実装。

## 方針決定（2026-09-11）

Demographics 系はある程度ローカライズが必要。表記種別（syllabic／phonetic／alphabetic）の CKM への提案は行ってよいが、採否・時期が読めないので、**NPO openEHR Japan で使う分はローカライズで進める**。CR は並行して出し、受理されたら移行する。

### 国際版に触れずに済む根拠（definition を確認）

| アーキタイプ | 使える受け皿 | 出現 |
|---|---|---|
| CLUSTER.address.v1 | at0020 Structured address スロット（include 制約なし） | 0..* |
| CLUSTER.person.v1 | at0002 Structured name スロット（同上）、at0008 Additional details スロット（同上） | 0..* |
| CLUSTER.organisation.v1 | at0017 Additional details スロット（同上）。Name（at0001）は 0..1 なので繰り返し不可 | 0..* |
| CLUSTER.structured_name.v1 | スロット無し。Given name／Family name は 0..* だが、漢字とカナを同一要素の複数値にするのは意味が崩れるので不採用 | — |

### ローカライズ成果物（案）

1. `openEHR-EHR-CLUSTER.structured_address_jp.v0`（仮名）：address.v1 の Structured address スロット用。都道府県（JIS X 0401 コード）／市区町村（JIS X 0402）／町域／丁目／番地／号／建物名／部屋番号＋各カナ（案 A）。アドレス・ベース・レジストリ準拠。
2. `openEHR-EHR-CLUSTER.name_reading_jp.v0`（仮名）：person.v1／organisation.v1 の Additional details スロット用。姓（カナ）／名（カナ）／名称（カナ）／ローマ字／仮名種別。氏名はテンプレートで structured_name を 2 回占有する案と併存させ、どちらを正にするかは jp_referral の実装時に決める。
3. 命名規則：特殊化記号（ハイフン）は使わず、新規概念名＋`_jp` で国際版と区別する（旧資産の `-japan` 擬似特殊化は踏襲しない）。
4. 置き場：NPO openEHR Japan のローカルアーキタイプリポジトリ（GitHub、CKM-mirror と同じ配置で Archetype Designer に読み込める形）。国際 CKM には出さない。
5. CR：structured_name.v1 と organisation.v1 の Name に「Representation（表記種別）」を追加する提案を CKM Discourse に出す。根拠は ISO 22220／ISO 21090 EN.representation、DEMOGRAPHIC-PARTY_IDENTITY.person_name.v0 の先例、JP Core の iso21090-EN-representation 拡張との整合。
