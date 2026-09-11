# openEHR アーキタイプ日本語翻訳 用語集・スタイルガイド

紹介状（referral）関連アーキタイプ群の翻訳で訳語を揃えるための基準。
新しい訳語が確定するたびに追記する。1本目 openEHR-EHR-COMPOSITION.request.v1 で確定した内容を起点とする。
2026-09-06 小林先生の改訂（ケア対象者・医療従事者・臨床検査・薬剤監査・Extension 非翻訳、encounter＝診察／contact＝受診）を反映済み。

## 文体規則

- `text`（ノード名）は名詞句。句点なし。画面ラベルに使われる前提で簡潔に。
- `description` / `comment` / `purpose` / `use` / `misuse` は「〜。」で終える常体（である調）。
- 原文の段落・箇条書き（`- `）・空行はそのまま保つ。箇条書き末尾の `;` は「；」、末尾の `and` は「および」として行内に残す。
- アーキタイプ名（`COMPOSITION.encounter` など）、RM クラス名、`FHIR`/`CIMI` 等の固有名は英字のまま。 「archetype」という語自体も英字のまま書き、「アーキタイプ」とは訳さない（2026-09-10 校正で統一）。
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
| archetype | archetype | 英字のまま。「アーキタイプ」と書かない（problem_diagnosis 校正 2026-09-10 で統一。「本archetype」「CLUSTER archetype群」のように続ける） |
| reason for encounter | 受診理由 | 概念名のみ国内慣用を優先（encounter＝診察の例外） |
| contact type | 受診区分 | 管理上の区分（初診・再診・救急・予定入院など） |
| presenting problem | 受診時のプロブレム | 「主訴」は同義語としてテンプレートで使用可 |
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
| specific details | 詳細記録 | CLUSTER スロット。problem_diagnosis 校正（2026-09-10）で「具体的な詳細」から変更 |
| complex timing | 複雑なタイミング | CLUSTER.service_direction スロット |
| clinical indication | 臨床的適応 | |
| indefinite? | 無期限？ | Boolean。原文の疑問符を踏襲 |
| narrative description | 叙述的な説明 | |
| data element / data point | データ要素 / データ項目 | |
| coding with a coding system is desirable, if available | 利用可能であれば、コード体系によりコード化することが望ましい | comment の定型句（terminology 版と区別） |
| allows multiple occurrences | 複数回の出現を許容する | comment の定型句 |
| follow-up appointment | フォローアップ受診 | |
| problem / diagnosis / condition | プロブレム / 診断 / 病態 | 訳し分ける。日本でのPOMRの文脈ではProblemは問題や課題と翻訳されることもあるが、主にプロブレムとされることが多い。ここでもそれを踏襲する。problem_diagnosis |
| health problem | 健康上のプロブレム | problem＝プロブレムに合わせる（problem_diagnosis 校正 2026-09-10。「health issues」は引き続き「健康上の問題」） |
| healthcare professional | 医療従事者 | healthcare provider と同じ訳（要確認） |
| carer | 介護者 | |
| wellbeing / well-being | ウェルビーイング | OK |
| injury / disability | 外傷 / 障害 | |
| Problem List | プロブレムリスト | COMPOSITION.problem_list |
| Discharge Summary | 退院時サマリー | |
| clinical consultation | 診察 | 紹介の consultation（コンサルテーション）とは区別 |
| clinical decision support | 臨床意思決定支援 | |
| Problem Oriented Medical Record | プロブレム志向型診療記録 | Larry Weed は英字のまま |
| problem/diagnosis name | プロブレム・診断の名称 | 概念名「プロブレム・診断」に合わせ区切りは「・」（problem_diagnosis 校正 2026-09-10）。要確認：校正前の用語集は「プロブレム/診断名」 |
| date/time clinically recognised | 臨床的に認識された日時 | problem_diagnosis 校正（2026-09-10）で「臨床的認識日時」から変更 |
| date/time of onset | 発症日時 | |
| date/time of resolution | 治癒した日時 | resolution or remission＝解消または寛解（要確認） |
| severity: mild / moderate / severe | 重症度：軽症 / 中等症 / 重症 | |
| body site / anatomical location | 身体部位 / 解剖学的部位 | 訳し分ける |
| structured body site | 構造化された身体部位表現 | CLUSTER スロット。problem_diagnosis 校正（2026-09-10）で採用 |
| status (qualifier slot) | 状態 | request status＝依頼状態 に合わせる（要確認） |
| clinical description / course description | 臨床的説明 / 経過記載 | problem_diagnosis 校正（2026-09-10）で「経過の説明」→「経過記載」 |
| diagnostic certainty: suspected / probable / confirmed | 診断確度：疑い / 推定 / 確定 | problem_diagnosis 校正（2026-09-10）で採用。校正前は「診断の確からしさ：疑い / ほぼ確実 / 確定」（指定難病の慣用訳） |
| cause / aetiology | 原因 / 病因 | |
| variant / subtype | 亜型 / サブタイプ | 要確認 |
| impact | 影響 | |
| comment (element) | コメント | |
| last updated | 最終更新日 | |
| precoordinated code | 事前調整されたコード | SNOMED CT の pre-coordination |
| terminology / external terminology | 用語集 / 外部用語集 | |
| valueset | 値セット | |
| partial dates are acceptable | 部分的な日付も許容される | comment の定型句 |
| examination findings | 診察所見 | |
| laboratory test result | 臨床検査結果 | |
| imaging examination / imaging diagnosis | 画像検査 / 画像診断 | |
| pathological diagnosis | 病理診断 | |
| procedure | 処置 | |
| differential diagnosis | 鑑別診断 | |
| presenting complaint | 主訴 | chief complaint と同じ |
| health risk | 健康リスク | |
| adverse reaction / allergy / intolerance | 有害反応 / アレルギー / 不耐性 | |
| exclusion | 除外 | |
| Common Terminology Criteria for Adverse Events | 有害事象共通用語規準（CTCAE） | JCOG 訳 |
| Guillain-Barre Syndrome / acute motor axonal neuropathy | ギラン・バレー症候群 / 急性運動性軸索型ニューロパチー | |
| qualifier | 修飾子 | 単独で用語集を構成するものとして「修飾子」を用いることとする。用語集とは関わりなく資源言語の語句として診断名に付属して意味を加えるものは修飾語として区別する。 |
| episodicity: new / ongoing / indeterminate | エピソード区分：新規 / 継続中 / 判定不能 | problem_qualifier |
| active / inactive | アクティブ / インアクティブ |  |
| current / past | 現症 / 既往 | 診断、病歴の文脈では現在、過去よりもこちらが適切と考えられる |
| diagnostic status: preliminary / working / established | 診断状況：予備的 / 暫定 / 最終 | 診断確度（疑い / 推定 / 確定）とは別軸。校正（2026-09-11）で「診断の段階」→「診断状況」、「初期」→「予備的」 |
| diagnostic category: principal diagnosis / secondary diagnosis / complication | 診断カテゴリ：主病名 / 副病名 / 合併症 |  |
| comorbid condition | 併存疾患 | |
| occurrence: first occurrence / recurrence / relapsed | 発生区分：初発 / 再発 / 再燃 | recurrence＝再発、relapse＝再燃（腫瘍学の慣用） |
| admission diagnosis | 入院時診断 | DRG 報告用 |
| course label: acute / chronic / acute-on-chronic | 経過区分：急性 / 慢性 / 慢性疾患の急性増悪 | at0094 text に合わせた（校正 2026-09-11） |
| resolution phase: resolved / resolving / not resolving / refuted | 治癒段階：治癒 / 回復中 / 未回復 / 否定 | at0083 text に合わせ「治癒段階」（校正 2026-09-11） |
| remission status: in remission / not in remission | 寛解状態：寛解中 / 非寛解 | |
| level of control: controlled / not controlled | コントロール状況：コントロール良好 / コントロール不良 | 校正（2026-09-11）で「コントロール状態」→「コントロール状況」 |
| progression: improving / stable / worsening | 進行状況：改善 / 安定 / 悪化 | |
| indeterminate | 判定不能 |  |
| disorder category | 疾患カテゴリ | 例：がん、精神保健および／または依存症、感染症、希少疾患 |
| episode of care | ケアエピソード | |
| DRG | DRG | 英字のまま |

## アーキタイプ別の確定訳（概念名）

| Archetype | at0000 text | 備考 |
|---|---|---|
| openEHR-EHR-COMPOSITION.request.v1 | 診療依頼書 | 候補：依頼書／サービス依頼。国内の「診療情報提供書」とは区別 |
| openEHR-EHR-EVALUATION.reason_for_encounter.v1 | 受診理由 | at0002 受診区分、at0004 受診時の問題（主訴を同義語として明記） |
| openEHR-EHR-SECTION.referral_details.v0 | 紹介状の詳細 | at0001 紹介依頼、at0002 詳細 |
| openEHR-EHR-INSTRUCTION.service_request.v1 (1.1.2) | サービス依頼 | 緊急度の値：緊急／至急／通常 |
| openEHR-EHR-EVALUATION.problem_diagnosis.v1 (1.7.4) | プロブレム・診断 | 校正済み（2026-09-10）。重症度 軽症／中等症／重症、診断確度 疑い／推定／確定、at0046 状態 |
| openEHR-EHR-CLUSTER.problem_qualifier.v2 (2.1.1) | プロブレム・診断の修飾子 | EVALUATION.problem_diagnosis の「状態」スロット用。値セットは共通語表の各行を参照 |
