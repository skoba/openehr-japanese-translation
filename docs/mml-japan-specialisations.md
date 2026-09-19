# MML の -japan / -mml 特殊化の調査（日本対応 specialisation の検討資料、2026-09-14）

`docs/localisation-ja.md` の設計（住所・人・氏名・機関名のローカライズ）を進めるにあたり、過去の MML 作業（https://github.com/skoba/mml/tree/master/openEHR）で日本対応として作られた特殊化 archetype と MML 共通部品を調べ、何を追加していたか、現行 CKM archetype にどう対応するか、今回のローカライズ設計に何を引き継ぐべきかを整理する。日本語訳そのものは参考にならない（MML 側の openEHR archetype に ja 訳はほぼ無い）ので、**構造と値セット**を対象にした。

## 1. 調査範囲と方法

- 対象リポジトリ: skoba/mml `openEHR/archetypes/`（読み取りのみ）。MML 関連の archetype は次の 3 系統。
  - `-japan` / `-mml` 特殊化（旧 CKM archetype の specialisation）: address-japan, person_name-mml, telecom_details-japan, telecom_details-mml, organisation-mml, individual_personal-mml, individual_professional-mml
  - MML 共通部品を直接 CLUSTER 化したもの（`mml_*`）: mml_name, mml_address, mml_phone, mml_facility, mml_department, mml_id, mml_personalized_info, mml_patient_module, mml_creator_info ほか
  - 日本固有概念: hoken（保険）, hoken-kaigo（介護保険、hoken の特殊化）
- 方法: 各 ADL の definition を機械的に展開し、親 archetype との差分（`at0.N` の追加ノード、`atNNNN.1` の再定義ノード、値セット）を取り出した。MML4 仕様の日本語語彙は `doc/MML4/*.adoc` から取り、`glossary-ja.md` の「MML4 …」行に登録済み（PR #29）。
- 注意: これらの特殊化の親は 2010 年前後の CKM archetype（address.v1 旧版, person_name.v1, telecom_details.v1, organisation.v1 旧版, individual_personal.v1）であり、現行の CKM 公開版（CLUSTER.address.v1 現行版, CLUSTER.structured_name.v1, CLUSTER.electronic_communication.v1, CLUSTER.organisation.v1 現行版, CLUSTER.person.v1）とは構造が違う。**そのまま再利用はできない**。

## 2. 特殊化ごとの追加内容

### 2.1 住所: CLUSTER.address-japan.v1（親: 旧 CLUSTER.address.v1）

| 追加・変更 | 内容 | MML4 との対応 |
|---|---|---|
| at0.29 Representation code（DV_CODED_TEXT） | 住所の表記種別。値 I（Ideographic）/ A（Alphabetic）/ P（Phonetic）。HL7 table 4000 を参照 | mmlAd:repCode |
| at0006.1 Address type with HL7 table | 住所種別の値セットを拡張。追加値: Permanent（本籍）, Country of origin, Birth（出生地）, Office, Residence at birth, Registry home（住民票住所）, Bad address, Birth delivery location | mmlAd:addressClass（MML0002: current / permanent / mailing / business / office / home / birth / country） |
| Structured address 内に at0.18 prefecture / at0.19 city / at0.20 town、at0005.1 Home number | 都道府県／市区郡／町村／番地 | mmlAd:prefecture / city / town / homeNumber |
| at0004.1 Zip code, at0.16 country code | 郵便番号、国コード（ISO 3166 A3） | mmlAd:zip / countryCode |

### 2.2 人名: CLUSTER.person_name-mml.v1（親: CLUSTER.person_name.v1）

| 追加 | 内容 | MML4 との対応 |
|---|---|---|
| at0.23 Name representation（DV_CODED_TEXT） | 氏名の表記種別。値 I / A / P | mmlNm:repCode |
| at0.27 degree（DV_TEXT） | 学位（M.D., Ph.D. など）。Structured name 内、Suffix の後 | mmlNm:degree |
| （既存）Title / Given / Middle / Family / Suffix | 肩書き／名／ミドルネーム／姓／接尾辞 | mmlNm:prefix / given / middle / family |

### 2.3 連絡先: CLUSTER.telecom_details-japan.v1、telecom_details-mml.v1（親: CLUSTER.telecom_details.v1）

| 追加 | 内容 | MML4 との対応 |
|---|---|---|
| Structured telecoms 内に at0.21 City（局番） | Country code / Area code / **City** / Number / Extension の 5 分割 | mmlPh:country / area / city / number / extension |
| at0.20 Memo | 使用時間帯などのメモ | mmlPh:memo |
| （既存）Telecoms type, Email address | 装置の種類、電子メール | mmlPh:telEquipType（MML0003）, mmlCm:email |

-japan と -mml の差は概念名と説明文だけで、構造は同じ。

### 2.4 組織: CLUSTER.organisation-mml.v1（親: 旧 CLUSTER.organisation.v1）

| 追加 | 内容 | MML4 との対応 |
|---|---|---|
| at0.15 Name representation（DV_CODED_TEXT） | 組織名の表記種別。値 I（Ideographic, i.e. Kanji）/ A / P | mmlFc:repCode |
| at0.20 Other names（CLUSTER 0..*） | Name と Name representation を use_node で再利用し、別表記の名称を複数持たせる | mmlFc:name の繰り返し（表記法ごと） |
| at0011.1 Identifier を DV_IDENTIFIER に変更、at0.12 Identifier type / at0.13 check digit / at0.14 check digit schema | MML Id 形式の 4 属性 | mmlCm:Id（type / checkDigit / checkDigitSchema） |
| at0.19 Other identifiers（CLUSTER 0..*） | 上記 4 要素の組を複数 | mmlCm:Id の繰り返し |

### 2.5 個人: CLUSTER.individual_personal-mml.v1（親: CLUSTER.individual_personal.v1）

| 追加 | 内容 | MML4 との対応 |
|---|---|---|
| at0.6 master id / at0.7 other id（各 Identifier + Type + checkDigit + checkDigitSchema） | 患者 ID（主 ID／その他 ID） | mmlPi:masterId / otherId, mmlCm:Id |
| at0.4 marital, at0.15 account number, at0.16 social identification | 婚姻状態、会計番号、社会的 ID | mmlPi:marital / accountNumber / socialIdentification |
| at0.17 nationality（primary / secondary） | 国籍 | mmlPi:nationality / subtype |
| at0.2 Facility, at0.3 Department（スロット） | 所属施設、診療科 | mmlFc:Facility, mmlDp:Department |
| Name スロットを 1..* に | 表記法ごとの氏名を複数 | mmlNm:Name の繰り返し |

### 2.6 医療従事者: CLUSTER.individual_professional-mml.v1（親: CLUSTER.individual_professional.v1）

| 追加 | 内容 | MML4 との対応 |
|---|---|---|
| at0.2 License（DV_CODED_TEXT 0..*） | 資格。値: doctor, dentist, nurse, assistantNurse, lab, rad, pharmacist, pt, ot, psy, cps, nutritionist, dentalHygienist, dentalTechnician, clinicalEngineer, careManager, acupuncturist, patient, other | mmlCi:creatorLicense（MML0026） |
| Professional Identifier を DV_IDENTIFIER に、type / check digit / schema を追加、Other identifier 0..* | 医療従事者 ID | mmlCm:Id |

### 2.7 保険: CLUSTER.hoken.v1、hoken-kaigo.v1

健康保険（保険者番号・記号番号・有効期間・自己負担割合など）と、その特殊化としての介護保険。現行 CKM に対応する archetype は無い。用語定義は en / ja とも空で、構造だけの下書き。

### 2.8 MML 共通部品（mml_*）

MML4 の共通形式（Id 形式・人名表現形式・住所表現形式・電話番号表現形式・施設情報形式・診療科情報形式・個人情報形式・作成者情報形式・患者情報モジュール）を要素名そのまま（`mmlNm:family` など）で CLUSTER 化したもの。MML ⇔ openEHR の写像実験用で、翻訳・ローカライズの参考にはならないが、**日本の帳票要件として何が要ったか**の一覧としては有用（§3）。

## 3. 現行 CKM archetype との対応と、ローカライズ設計への示唆

### 3.1 表記種別（Representation）は MML でも独立の軸だった

MML 特殊化は住所（address-japan）、人名（person_name-mml）、組織名（organisation-mml）の 3 か所に **同じ型の「表記種別」要素（I / A / P）** を追加し、組織名では「別表記の名称を複数持つ CLUSTER（Other names）」まで作っている。これは `docs/cr-name-representation.md` の提案（structured_name.v1 への Representation 追加、organisation.v1 への Alternative name CLUSTER）と同型であり、**2010 年代の MML 写像でも同じ穴を同じ形で埋めていた**という裏付けになる。CR 本文の Precedents に「MML（日本の医療文書交換規約）の openEHR 写像でも同じ要素を特殊化で追加していた」と一行足せる。

値セットの違い: MML は I / A / **P（Phonetic）** の 3 値で、かな読みを P で表していた。CR 草案は Ideographic / **Syllabic** / Alphabetic（＋Phonetic は要検討）。FHIR JP Core（IDE / SYL / ABC）に合わせるなら Syllabic を正とし、MML の P はかな読みの意味で Syllabic に写像する、と整理しておく。

### 3.2 住所

現行 CLUSTER.address.v1 は Address line / City/Town / District/County / State/Territory/Province / Postal code / Country ＋ Structured address スロット（0..*）。MML が Structured address 内に足していた prefecture / city / town / homeNumber は、現行版では **State（都道府県）・City/Town（市区町村）・District（郡）・Address line（番地以下）に写像でき、翻訳層で comment に「例：都道府県」と書くだけで足りる**。足りないのは次の 2 点で、どちらも `localisation-ja.md` の structured_address_jp（Structured address スロット用の新規 CLUSTER）の要件として引き継ぐ。

- 町域／丁目／番地／号／建物名／部屋番号の分割（MML の homeNumber は「番地以下すべて」で分割していない。アドレス・ベース・レジストリ準拠で分ける現行案の方が細かい）。
- 住所の読み（MML では Representation code で表記ごとに住所全体を繰り返す＝現行案の案 B 相当。案 A（各要素に「…（カナ）」を並置）は MML には無い）。

住所種別: MML の addressClass（現住所・本籍・郵送先・勤務先・事務所・自宅・出生地・住民票）は、現行版の Type（Physical / Postal / Both）と Use（Business / Residential / Temporary accommodation）に収まらない値（本籍、住民票、出生地）を含む。日本の帳票で本籍・住民票住所が要る場合は、Use の「その他テキスト」か、structured_address_jp 側の「住所の種類」要素で扱う候補として記録しておく。

### 3.3 氏名

現行 CLUSTER.structured_name.v1 は Title / Given name / Family name / Suffix（いずれも 0..*）。MML の prefix → Title、degree → Suffix、middle → Given name の 2 回出現で写像できる。**MML が足していたのは Name representation だけ**であり、これが CR の本体。person.v1 の Name（非構造化 0..1）に読みを併記できない問題も MML と同じ。

### 3.4 電子的連絡先

現行 CLUSTER.electronic_communication.v1 は Type / Value / Purpose / Additional details スロット / Comment で、電話番号は Value 1 要素（一連表記）。MML の 5 分割（国番号／市外局番／局番／加入番号／内線）は現行版では表現しないが、**日本の帳票は一連表記（03-1234-5678 内線 123）で足りる**ので特殊化は不要と判断する。使用時間帯などの Memo は Comment に入る。FAX は Type の値。

### 3.5 組織（施設・診療科）

現行 CLUSTER.organisation.v1 は Name（0..1）/ Identifier（DV_IDENTIFIER 0..*）/ Role / Address / Electronic communication / Contact person / **Parent organisation スロット** / Additional details / Comment。MML の施設（Facility）と診療科（Department）は、診療科を organisation として Parent organisation に施設を入れる入れ子で表せる（Role に「診療科」）。組織名の読みは、現行版の Name が 0..1 のため MML と同じ問題が残り、CR 草案 B 案 1（Alternative name CLUSTER）が対応する。当面は Additional details スロット用の name_reading_jp（`localisation-ja.md` 成果物 2）で受ける。

### 3.6 識別子

MML の Id 形式（値・type・tableId・checkDigit・checkDigitSchema）は、現行版の DV_IDENTIFIER（id / type / issuer / assigner）で type・issuer まで表現できる。チェックディジットとその方式は ID 文字列の一部として運用するのが openEHR の流儀で、**MML 特殊化が足していた check digit / check digit schema 要素は持ち込まない**。

### 3.7 資格・保険（CKM に無い日本固有概念）

- 医療従事者の資格（MML0026 の値セット: 医師・歯科医師・看護師・准看護師・臨床検査技師・診療放射線技師・薬剤師・理学療法士・作業療法士・臨床心理士・臨床工学技士・管理栄養士・歯科衛生士・歯科技工士・ケアマネジャー・鍼灸師 …）は person.v1 / organisation.v1 に置き場が無い。CKM の CLUSTER.professional_role 系か、person.v1 の Additional details スロット用のローカル CLUSTER の候補。紹介状（jp_referral）で「担当医（医師）」以上の粒度が要るかは要件次第なので、今は候補として記録するにとどめる。
- 健康保険・介護保険（hoken / hoken-kaigo）は CKM に対応 archetype が無い。診療情報提供書の様式には保険情報は無いので、スプリントの範囲外。将来 L 群に入れるなら hoken.v1 の構造（保険者・記号番号・有効期間・負担割合）が出発点になる。

## 4. 結論（localisation-ja.md への反映案）

1. **表記種別は案 B（表記種別＋複数出現）を本命にする**根拠として、MML 特殊化が住所・人名・組織名の 3 か所で同じ Representation code（I / A / P）を採っていたことを `localisation-ja.md` と `cr-name-representation.md`（Precedents）に追記する。値は FHIR JP Core の IDE / SYL / ABC に合わせ、MML の P（Phonetic）＝かな読みは Syllabic に対応させる。
2. **structured_address_jp** の要素は MML 住所表現形式（都道府県／市区郡／町村／番地）を包含しつつ、番地以下を丁目・番地・号・建物名・部屋番号に分割する現行案のままでよい。住所の読みは案 B（Representation code で住所ごとに繰り返す）が MML と整合する。住所種別（本籍・住民票・出生地）は要件が出た時点で「住所の種類」要素として追加する候補。
3. **electronic_communication.v1 は特殊化も新規 CLUSTER も不要**（一連表記＋Type＋Comment で足りる）。
4. **識別子のチェックディジット要素は持ち込まない**。DV_IDENTIFIER の type / issuer で足りる。
5. **施設と診療科は organisation.v1 の Parent organisation 入れ子**で表す。組織名の読みは name_reading_jp（暫定）→ CR（本命）。
6. 資格（MML0026）と保険（hoken）は今回のスプリント外。候補として本資料に残す。
7. 命名は既決どおり、特殊化ではなく `_jp` を概念名に含む新規 CLUSTER とする。MML の `-japan` / `-mml` は ADL の正規の特殊化記法（`<概念名>-<特殊化名>`、`specialise` 節あり）で作られた特殊化だが、親が旧版 CKM archetype なので現行版には当てられない。なお、現行版を `-jp` で特殊化する選択肢自体は openEHR 上は正当であり、要素の追加も特殊化で可能なので、新規 CLUSTER 方式との比較は §4 末尾に記す。

### 補足: 特殊化（`-jp`）と新規 CLUSTER（`_jp`）の比較

| 観点 | 現行版の特殊化（例: `openEHR-EHR-CLUSTER.address-jp.v1`） | スロットに挿す新規 CLUSTER（例: `openEHR-EHR-CLUSTER.structured_address_jp.v0`） |
|---|---|---|
| openEHR 上の正当性 | 正規の記法。要素の追加・制約の強化ができる | 正規。国際版はそのまま使い、スロットで拡張 |
| 親の改版への追従 | 親の新リビジョンごとに特殊化を作り直す（MML の `-japan` が旧版に取り残された原因） | 親の改版の影響を受けにくい（スロットの include 制約が変わらない限り） |
| 国際 CKM の ja 訳との関係 | 特殊化は国際 CKM に載らないため、親の ja 訳を再利用しつつ別管理 | 国際版の ja 訳をそのまま使える。新規 CLUSTER は NPO 側で ja / en を持つ |
| テンプレート・AQL | 特殊化した archetype_id で問い合わせる（国際版との互換パスは失われる） | 国際版のパスが保たれ、日本固有部分だけ別 archetype_id |
| 国際版で表せない要素 | 特殊化内に追加できる（表記種別など） | 追加要素はすべて新規 CLUSTER 側。表記種別は CR で国際版に入れるのが本命 |

`localisation-ja.md` の方針決定（2026-09-11）は後者を採っている。前者が有利になるのは、スロットが無い場所に要素を足したい場合（例: structured_name.v1 に表記種別を足す）だが、それは CR で国際版に入れる方針なので、当面は新規 CLUSTER 方式で進める。

## 5. 参照

- skoba/mml `openEHR/archetypes/cluster/`: openEHR-EHR-CLUSTER.address-japan.v1.adl, person_name-mml.v1.adl, telecom_details-japan.v1.adl, telecom_details-mml.v1.adl, organisation-mml.v1.adl, individual_personal-mml.v1.adl, individual_professional-mml.v1.adl, hoken.v1.adl, mml_*.adl
- skoba/mml `doc/MML4/`: name.adoc, address.adoc, phone.adoc, facility.adoc, department.adoc, id.adoc, personalized_info.adoc, creator_info.adoc
- 本リポジトリ: docs/localisation-ja.md（三層の切り分け・方針決定）, docs/cr-name-representation.md（CR 草案）, glossary-ja.md の「MML4 …」行
