# openEHR アーキタイプ日本語翻訳 用語集・スタイルガイド

紹介状（referral）関連アーキタイプ群の翻訳で訳語を揃えるための基準。
新しい訳語が確定するたびに追記する。1本目 openEHR-EHR-COMPOSITION.request.v1 で確定した内容を起点とする。
2026-09-06 小林先生の改訂（ケア対象者・医療従事者・臨床検査・薬剤監査・Extension 非翻訳、encounter＝診察／contact＝受診）を反映済み。

## 文体規則

- `text`（ノード名）は名詞句。句点なし。画面ラベルに使われる前提で簡潔に。
- `description` / `comment` / `purpose` / `use` / `misuse` は「〜。」で終える常体（である調）。
- 原文の段落・箇条書き（`- `）・空行はそのまま保つ。箇条書き末尾の `;` は「；」、末尾の `and` は「および」として行内に残す。
- アーキタイプ名（`COMPOSITION.encounter` など）、RM クラス名、`FHIR`/`CIMI` 等の固有名は英字のまま。
- `@ internal @` は訳さない。内部ノード名 `Tree` / `List` / `History` 等も他言語版（de/sv/nb/nl）に倣い英字のまま残す。
- CLUSTER スロット `Extension` も訳さず英字のまま（description / comment は訳す）。
- `copyright` は原文どおり（`© openEHR Foundation`）。
- `keywords` は原文の語に加え、CKM で日本語検索されそうな語を少数追加してよい（例：「紹介状」）。
- 括弧は全角「（）」、区切りは読点「、」。英数字は半角。

## 共通語（RM・アーキタイプ横断）

| English | 日本語 | 備考 |
|---|---|---|
| subject of care | ケア対象者 | 「患者」と限定しない |
| healthcare provider | 医療従事者 | 個人・組織の両方を含む |
| organisation | 医療機関 / 組織 / 部門 | 医療文脈では「医療機関」 |
| encounter | 診察 | contact と区別する |
| contact (healthcare contact) | 受診 | encounter と区別する |
| encounter or contact | 診察または受診 | reason_for_encounter |
| transfer of care | 診療の移管 | |
| handover of care and clinical responsibility | 診療および臨床的責任の引き継ぎ | |
| request | 依頼 | 「要求」は使わない |
| service | サービス | |
| referral | 紹介 | 文書は「紹介状」 |
| consultation | コンサルテーション | |
| second opinion | セカンドオピニオン | |
| management advice | 診療方針に関する助言 | |
| diagnostic test | 臨床検査 | |
| home care from visiting nurses | 訪問看護師による在宅ケア | |
| rehabilitation facility | リハビリテーション施設 | |
| aged care assessment | 高齢者ケアのアセスメント | 「要介護認定」とは読み替えない（要確認） |
| medication review | 薬剤監査 | |
| physiotherapy / occupational therapy | 理学療法 / 作業療法 | |
| targeted / untargeted (request) | 宛先指定あり / 宛先指定なし | |
| Extension | Extension | 訳さない |
| local context | ローカルな文脈 | |
| reference models/formalisms | 参照モデル／形式体系 | |
| additional metadata | 追加メタデータ | |
| Tree | Tree | 訳さない |
| reason for encounter | 受診理由 | 概念名のみ国内慣用を優先（encounter＝診察の例外） |
| contact type | 受診区分 | 管理上の区分（初診・再診・救急・予定入院など） |
| presenting problem | 受診時の問題 | 「主訴」は同義語としてテンプレートで使用可 |
| chief complaint | 主訴 | |
| administrative category | 管理上の区分 | |
| health issues / symptoms / physical signs | 健康上の問題 / 症状 / 身体的徴候 | |
| paramedical staff | 救急救命士 | 文脈により「救急隊員」 |
| routine antenatal visit | 定期の妊婦健診 | |
| elective admission | 予定入院 | |
| pre-employment medical | 雇用時健康診断 | |
| annual medical check-up | 年1回の健康診断 | |
| coding with a terminology is desirable | 用語集によりコード化することが望ましい | comment の定型句 |
| in templates | テンプレートでは | |
| referral details | 紹介状の詳細 | SECTION 名 |
| referral request (slot) | 紹介依頼 | INSTRUCTION.service_request スロット名 |
| Details (slot) | 詳細 | 臨床情報スロット |
| example framework for modelling ... within a template | テンプレート内で〜をモデル化するための枠組みの例 | SECTION 系の定型句 |
| nested within | 〜の中に入れ子にして | |
| clinician, organisation or agency | 医療従事者、医療機関、または事業者 | service_request（要確認） |
| service request | サービス依頼 | INSTRUCTION 概念名 |
| order | オーダー | order identifier＝オーダー識別子、order detail＝オーダー詳細 |
| requester / receiver | 依頼者 / 受領者 | Placer/Filler Order Identifier は英字のまま |
| service due | サービス実施予定 | 日時以外のテキストも許容 |
| service period start / expiry | サービス期間の開始 / 終了 | |
| reason for request / reason description | 依頼理由 / 理由の説明 | |
| intent | 意図 | |
| urgency: emergency / urgent / routine | 緊急度：緊急 / 至急 / 通常 | 要確認 |
| supplementary information | 補足情報 | Boolean。後送する情報 |
| supporting information | 参考資料 | 添付する電子文書・画像等 |
| patient requirements | 患者の必要事項 | 言語・移動手段など |
| service name / service type | サービス名 / サービス種別 | |
| request status | 依頼状態 | |
| distribution list | 配布先リスト | |
| specific details | 具体的な詳細 | CLUSTER スロット |
| complex timing | 複雑なタイミング | CLUSTER.service_direction スロット |
| clinical indication | 臨床的適応 | |
| indefinite? | 無期限？ | Boolean。原文の疑問符を踏襲 |
| narrative description | 叙述的な説明 | |
| data element / data point | データ要素 / データ項目 | |
| coding with a coding system is desirable, if available | 利用可能であれば、コード体系によりコード化することが望ましい | comment の定型句（terminology 版と区別） |
| allows multiple occurrences | 複数回の出現を許容する | comment の定型句 |
| follow-up appointment | フォローアップ受診 | |

## アーキタイプ別の確定訳（概念名）

| Archetype | at0000 text | 備考 |
|---|---|---|
| openEHR-EHR-COMPOSITION.request.v1 | 診療依頼書 | 候補：依頼書／サービス依頼。国内の「診療情報提供書」とは区別 |
| openEHR-EHR-EVALUATION.reason_for_encounter.v1 | 受診理由 | at0002 受診区分、at0004 受診時の問題（主訴を同義語として明記） |
| openEHR-EHR-SECTION.referral_details.v0 | 紹介状の詳細 | at0001 紹介依頼、at0002 詳細 |
| openEHR-EHR-INSTRUCTION.service_request.v1 (1.1.2) | サービス依頼 | 緊急度の値：緊急／至急／通常 |
