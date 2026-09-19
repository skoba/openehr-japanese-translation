# openEHR アーキタイプ日本語翻訳 用語集・スタイルガイド

紹介状（referral）関連アーキタイプ群の翻訳で訳語を揃えるための基準。
新しい訳語が確定するたびに追記する。1本目 openEHR-EHR-COMPOSITION.request.v1 で確定した内容を起点とする。
2026-09-06 小林先生の改訂（ケア対象者・医療従事者・臨床検査・薬剤監査・Extension 非翻訳、encounter＝診察／contact＝受診）を反映済み。

## 文体規則

- `text`（ノード名）は名詞句。句点なし。画面ラベルに使われる前提で簡潔に。
- `description` / `comment` / `purpose` / `use` / `misuse` は「〜。」で終える常体（である調）。
- 原文の段落・箇条書き（`- `）・空行はそのまま保つ。箇条書きの各項目は「。」で終え、原文末尾の `;` / `; or` / `; and` は「；」「；または」「；および」として残さない（organisation.v1 校正 2026-09-19 で改訂。旧規則は「；」「および」を行内に残していた）。
- アーキタイプ名（`COMPOSITION.encounter` など）、RM クラス名、`FHIR`/`CIMI` 等の固有名は英字のまま。 「archetype」という語自体も英字のまま書き、「アーキタイプ」とは訳さない（2026-09-10 校正で統一）。
- `@ internal @` は訳さない。内部ノード名 `Tree` / `List` / `History` 等も他言語版（de/sv/nb/nl）に倣い英字のまま残す。
- CLUSTER スロット `Extension` も訳さず英字のまま（description / comment は訳す）。
- `copyright` は原文どおり（`© openEHR Foundation`）。
- `keywords` は原文の語に加え、CKM で日本語検索されそうな語を少数追加してよい（例：「紹介状」）。
- 括弧は全角「（）」、区切りは読点「、」。英数字は半角。

### こなれた訳のための規則（2026-09-19、校正の傾向から）

原文の構文をなぞらず、日本語の医療文書として自然に読めることを優先する。校正済み archetype（person.v1、electronic_communication.v1、organisation.v1、problem_diagnosis.v1、problem_qualifier.v2、symptom_sign.v2、story.v1、clinical_synopsis.v1、adhoc.v1）の `work/fill.rb` と docs/style-examples.md を訳の手本とし、同じ構文は同じ訳し方をする。

1. 関係節が二重三重になる文は二文に分ける（一文 60 字程度を目安）。英文の一文を一文に対応させる必要はない。
2. 「〜についての詳細」→「〜に関する詳細情報」。「〜の特定」「〜の記述」のような名詞化は、可能なら動詞に戻す（例：identification of X →「X を示す」「X を特定する」）。
3. as (they are) known or understood in the course of clinical documentation →「臨床記録の作成に際して取得した」（定型）。
4. Not to be used to record X - use Y for this purpose →「X の記録には、本archetypeではなく Y を用いる」。「〜ために用いてはならない。その目的には〜を用いること」を機械的に繰り返さない。
5. 箇条書きの各項目は名詞句で止めず、「〜を用いて、〜を記録する。」のように動詞で終える。
6. description / comment 内の the individual / a person は「個人」、健康記録の対象者本人は「本人」。「その人」は使わない。
7. 「〜であって」「〜でありうる」「〜されうる」のような英文直訳の接続・助動詞は、「〜であり」「〜こともある」「〜できる」に言い換える。
8. often ad hoc or when it is not appropriate or possible to … →「必要に応じて情報を記録する場合や、…の利用が適切でない、または利用できない場合を主に想定している」（electronic_communication.v1 / organisation.v1 校正 2026-09-19。旧形「主に、…を想定している」は使わない）。

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
| reference models/formalisms | 参照モデルや形式手法 | problem_diagnosis 校正版（at0071 Extension description）に合わせた（2026-09-11、要確認） |
| additional metadata | 追加メタデータ | |
| Tree | Tree | 訳さない |
| archetype | archetype | 英字のまま。「アーキタイプ」と書かない（problem_diagnosis 校正 2026-09-10 で統一。「本archetype」「CLUSTER archetype群」のように続ける） |
| reason for encounter | 受診理由 | 概念名のみ国内慣用を優先（encounter＝診察の例外） |
| contact type | 受診区分 | 管理上の区分（初診・再診・救急・予定入院など） |
| presenting problem | 受診時のプロブレム | 「主訴」は同義語としてテンプレートで使用可 |
| chief complaint | 主訴 | |
| administrative category | 管理上の区分 | |
| category | 区分 | 断りがなければ「区分」（校正 2026-09-11。「カテゴリ」は使わない） |
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
| data element / data point | データエレメント / データ項目 | 校正（2026-09-11）で「データ要素」→「データエレメント」に統一 |
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
| current / past | 現病 / 既往 | 診断、病歴の文脈では現在、過去よりもこちらが適切と考えられる |
| diagnostic status: preliminary / working / established / refuted | 診断状況：予備的 / 暫定 / 最終 / 否定 | 診断確度（疑い / 推定 / 確定）とは別軸。校正（2026-09-11）で「診断の段階」→「診断状況」、「初期」→「予備的」 |
| diagnostic category: principal diagnosis / secondary diagnosis / complication | 診断区分：主病名 / 副病名 / 合併症 | Category＝区分（校正 2026-09-11） |
| comorbid condition | 併存疾患 | |
| occurrence: first occurrence / recurrence | 発生区分：初発 / 再発 | recurrence＝再発（腫瘍学の慣用） |
| admission diagnosis | 入院時診断 | DRG 報告用 |
| course label: acute / chronic / acute-on-chronic | 経過区分：急性 / 慢性 / 慢性疾患の急性増悪 | at0094 text に合わせた（校正 2026-09-11） |
| resolution phase: resolved / resolving / not resolving / relapsed | 治癒段階：治癒 / 回復中 / 未回復 / 再燃 | at0083 text に合わせ「治癒段階」（校正 2026-09-11） |
| remission status: in remission / not in remission | 寛解状態：寛解中 / 非寛解 | |
| level of control: controlled / not controlled | コントロール状況：コントロール良好 / コントロール不良 | 校正（2026-09-11）で「コントロール状態」→「コントロール状況」 |
| progression: improving / stable / worsening | 進行状況：改善 / 安定 / 悪化 | |
| indeterminate | 判定不能 |  |
| disorder category | 疾患区分 | 例：がん、精神保健および／または依存症、感染症、希少疾患 |
| episode of care | ケアエピソード | |
| DRG | DRG | 英字のまま |
| Story/History | 病歴 | OBSERVATION.story 概念名。story 校正（2026-09-11）で「ストーリー・病歴」→「病歴」 |
| story (narrative element) | 病歴の記述 | OBSERVATION.story at0004。対比文脈（story と history を並べるとき）の story は「語り」。keywords では検索語として「ストーリー」を併記可 |
| clinical history | 病歴 | |
| Event Series | Event Series | HISTORY の内部ノード名。Tree と同じく訳さない |
| Any event | 任意のイベント | OBSERVATION の既定イベント名（要確認） |
| structured detail | 構造化された詳細記録 | CLUSTER スロット。story 校正（2026-09-11）で「詳細記録」に揃えた |
| personal health record | 個人健康記録 | PHR |
| clinical questionnaire / questionnaire | 臨床問診票 / 問診票 | 校正（2026-09-12）で「質問票」→「問診票」。screening questionnaire＝スクリーニング問診票 |
| health event | 健康イベント | CLUSTER.health_event |
| care-giver | 介護者 | carer と同じ |
| narrative | 叙述 | narrative description＝叙述的な記述 |
| clinical synopsis | 臨床要約 | EVALUATION.clinical_synopsis 概念名（要確認。他候補：臨床サマリー） |
| synopsis (element) | 要約 | at0002 |
| epicrisis | エピクリーゼ | keywords（要確認。他候補：退院時総括） |
| meta observation | メタ観察 | clinical_synopsis use |
| report (document) | 報告書 | COMPOSITION.report |
| List | List | 内部ノード名。訳さない |
| ad hoc heading | 仮見出し | SECTION.adhoc 概念名。校正（2026-09-13）で「任意見出し」→「仮見出し」。テンプレートで改名される前提 |
| section heading / section header | セクション見出し | |
| renamed in a template | テンプレート内で名前を変更 | |
| symptom / sign / reported sign | 症状 / 徴候 / 報告された徴候 | CLUSTER.symptom_sign |
| Symptom/Sign name | 症状・徴候の名称 | at0001 |
| description (element) | 説明 | 叙述的な記述を入れる要素名（symptom_sign at0002 ほか） |
| pattern | パターン | symptom_sign at0003 |
| character | 性状 | symptom_sign at0189 |
| nadir | 最悪時 | symptom_sign at0200 |
| onset timing | 発症時期 | symptom_sign at0164 |
| episode onset / episode duration | エピソードの発症日時 / エピソードの持続期間 | symptom_sign at0152 / at0028 |
| previous episodes / number of previous episodes | 過去のエピソード / 過去のエピソードの回数 | symptom_sign at0146 / at0031 |
| associated symptom/sign | 随伴症状・徴候 | symptom_sign at0063 |
| factor / factor detail | 因子 / 因子の詳細 | symptom_sign |
| modifying / precipitating / resolving factor | 修飾因子 / 誘発因子 / 寛解因子 | symptom_sign at0018 / at0165 / at0190（寛解因子は OPQRST の慣用。description の resolution は「消失」） |
| effect: relieves / no effect / worsens | 影響：軽減 / 影響なし / 増悪 | symptom_sign at0017。at0155 Impact も「影響」 |
| progression (symptom): improving / unchanged / worsening / resolved | 進行状況：改善 / 不変 / 悪化 / 消失 | symptom_sign at0180。Unchanged＝不変（qualifier の Stable＝安定 とは別語） |
| severity category / severity rating | 重症度 / 重症度評価 | symptom_sign at0021 / at0198 |
| resolution date/time (symptom/sign) | 消失日時 | symptom_sign at0161。症状・徴候の resolution は「消失」、プロブレム・診断の resolution は「治癒」（problem_diagnosis 治癒した日時）と訳し分ける（校正 2026-09-12） |
| time interval | 時間間隔 | symptom_sign at0171 / at0195 |
| screening details (slot) | スクリーニングの詳細 | OBSERVATION.symptom_sign_screening |
| VAS / NRS | VAS / NRS | 英字のまま |
| heartburn / claudication | 胸やけ / 跛行 | 例示 |
| person (CLUSTER.person) | 人 | 概念名（校正 2026-09-19 で確定）。subject 以外の人一般 |
| name (person) | 氏名 | MML4 人名表現形式・個人情報形式の「氏名」（校正 2026-09-19 で確定） |
| structured name | 構造化された氏名 | CLUSTER.structured_name（概念名は #8 で確定） |
| identifier | 識別子 | person at0003。MML4 の Id 形式は「ID」 |
| role (person) | 役割 | person at0004。健康記録の対象者との関係または役割（校正 2026-09-19 で確定） |
| electronic communication | 電子的な連絡先 | CLUSTER.electronic_communication（targets #10）。person 校正（2026-09-19）で「電子的連絡先」→「電子的な連絡先」 |
| organisation (slot in person) | 組織 | 医療機関に限らないので「組織」。organisation.v1 の概念名は #6 で確定 |
| additional details (slot) | 追加の詳細情報 | electronic_communication 校正（2026-09-19）で「追加の詳細」→「追加の詳細情報」。person.v1 at0008 にも波及 |
| photo | 写真 | |
| label (person) | ラベル（識別用の説明） | person at0011（校正 2026-09-19） |
| demographic register / index | デモグラフィック登録簿 / インデックス | 要確認 |
| Master Patient Index / Health Provider Index | 患者マスターインデックス（MPI） / 医療従事者名簿（Health Provider Index） | person 校正（2026-09-19）で確定 |
| Demographic Information Model | デモグラフィック情報モデル | openEHR RM（要確認） |
| next-of-kin | 近親者 | |
| copyholder / contact person / family member details / specimen collector details / witness (slots) | 写し保有者 / 連絡担当者 / 家族構成員の詳細 / 検体採取者の詳細 / 目撃者 | 未訳 archetype のスロット名の仮訳（要確認。該当 archetype の翻訳時に確定） |
| MML4 人名表現形式: family / given / middle / fullname / prefix / degree | 姓 / 名 / ミドルネーム / フルネーム / 肩書き（敬称） / 学位 | skoba/mml doc/MML4/name.adoc。structured_name.v1 で使う |
| MML4 住所表現形式: full / prefecture / city / town / homeNumber / zip / countryCode | 一連住所 / 都道府県 / 市・区・郡 / 町・村 / 番地（丁目・建物名・部屋番号） / 郵便番号 / 国コード | doc/MML4/address.adoc。address.v1 で使う |
| MML4 住所の種類: current / permanent / mailing / business / office / home / birth | 現住所 / 本籍 / 郵送先 / 勤務先 / 事務所 / 自宅 / 出生地 | MML0002（要確認。address.v1 の値セットと照合） |
| MML4 電話番号表現形式: area / city / number / extension / full / country / memo / telEquipType | 市外局番 / 局番 / 加入番号 / 内線番号 / 一連電話番号 / 国番号 / メモ（使用時間帯など） / 装置の種類 | doc/MML4/phone.adoc。electronic_communication.v1 で使う |
| MML4 施設情報形式 / 診療科情報形式 | 施設（施設名称・施設 ID） / 診療科（診療科名称・診療科 ID） | doc/MML4/facility.adoc, department.adoc。organisation.v1 で使う |
| MML4 Id 形式: type / checkDigit / checkDigitSchema | ID の種類 / チェックディジット / チェックディジット方式 | doc/MML4/id.adoc |
| title (name) | 敬称 | structured_name at0001。MML4 prefix＝肩書き（要確認。他候補：肩書き、称号） |
| given name / family name | 名 / 姓 | structured_name at0002 / at0005（MML4 人名表現形式） |
| suffix (name) | 接尾辞 | structured_name at0006（要確認。他候補：サフィックス）。MML4 degree＝学位 はここ |
| first name / middle name / preferred name / nickname | ファーストネーム / ミドルネーム / 通称 / ニックネーム | structured_name at0002 comment |
| name usage | 氏名の用途 | structured_name use / misuse |
| ISO 22220 | ISO 22220 | 英字のまま |
| address line | 住所行 | address.v1 at0001。日本では町域〜部屋番号を 1 行（要確認） |
| city/town | 市区町村 | address.v1 at0002。政令指定都市は市＋区。JIS X 0402（localisation-ja.md） |
| district/county | 地区／郡 | address.v1 at0003。日本では町村の郡（要確認） |
| state/territory/province | 都道府県／州 | address.v1 at0004。JIS X 0401（要確認） |
| postal code / postcode / ZIP code | 郵便番号 / ポストコード / ZIP コード | address.v1 at0005。日本は 7 桁 |
| country | 国 | ISO 3166-1 alpha-2（日本は JP） |
| latitude / longitude / altitude | 緯度 / 経度 / 高度 | address.v1 |
| address type: physical / postal / both | 種別：物理的所在地 / 郵送先 / 両方 | address.v1 at0010（要確認） |
| address use: business / residential / temporary accommodation | 用途：事業所 / 自宅 / 一時滞在先 | address.v1 at0014。MML4 business＝勤務先、home＝自宅（要確認） |
| map URL | 地図 URL | |
| structured address (slot) | 構造化された住所 | address.v1 at0020。structured_address_jp を入れる想定 |
| geolocation code / geocode | 位置情報コード / ジオコード | address.v1 at0021（要確認） |
| address lookup service | 住所検索サービス | |
| landmark | 目印となる場所 | keywords では「目印」 |
| street-level | 街区レベル | address.v1 |
| type (electronic communication) | 種別 | electronic_communication.v1 at0001。address.v1 の Type に合わせる |
| value (electronic communication) | 値 | electronic_communication.v1 at0002。番号・メールアドレス等を含む（要確認。他候補：連絡先の値） |
| purpose (electronic communication) | 用途 | electronic_communication.v1 at0003。業務用・個人用を区別する（要確認。他候補：目的） |
| telephone / phone | 電話 | 一般語（keywords など）。値セットの「Telephone (excluding mobile telephone)」は固定電話 |
| mobile (cellular) telephone / telephone (excluding mobile telephone) | 携帯電話 / 固定電話 | electronic_communication.v1 at0005 / at0006 |
| email / email address / fax | 電子メール / 電子メールアドレス / ファクシミリ | electronic_communication.v1 at0007 / at0002 comment / at0009 |
| pager | ポケットベル | electronic_communication.v1 at0008（要確認。他候補：ページャー、無線呼出受信機）。日本語での認知しやすさを優先 |
| business use / personal use / both business and personal use | 業務用 / 個人用 / 業務用・個人用の両方 | electronic_communication.v1 at0010 / at0011 / at0012。場所ではなく用途を表す |
| area code / country code (telephone) / landline phone number | 市外局番 / 国番号 / 固定電話番号 | electronic_communication.v1 at0002 comment。MML4 電話番号表現形式に合わせる |
| chat / social media / asynchronous / communication | チャット / ソーシャルメディア / 非同期 / 通信 | electronic_communication.v1 keywords。SoMe は英字のまま保持 |
| video conferencing / voice calls | ビデオ会議 / 音声通話 | electronic_communication.v1 at0001 comment / at0005 description。SMS は英字のまま保持 |
| parent organisation | 親組織 | organisation.v1 at0021。企業に限らない上位組織を表す（校正 2026-09-19 で確定） |
| sub-organisation / subsidiary / satellite clinic | 傘下組織 / 子会社 / 分院 | organisation.v1 use, at0021 description。校正（2026-09-19）で「下部組織」→「傘下組織」 |
| registered business / local community support group | 登録された事業者 / 地域の支援団体 | organisation.v1 use。正式な組織と非公式な集まりを区別する（校正 2026-09-19 で確定） |
| healthcare practice group / payer / insurer | 診療グループ / 支払機関 / 保険者 | organisation.v1 at0000 comment。組織の例示であり、日本の特定の法人形態には限定しない。校正（2026-09-19）で「支払者」→「支払機関」 |
| department (organisation example) | 診療部門 | organisation.v1 at0000 comment。組織の例示（校正 2026-09-19 で確定）。MML4 診療科情報形式の「診療科」とは別 |
| oncologist / palliative care home nursing service | 腫瘍専門医 / 緩和ケアの訪問看護サービス | organisation.v1 at0004 comment。oncologist は原文どおり人の呼称を保持（校正 2026-09-19 で確定） |
| informal support network | 非公式な支援ネットワーク | organisation.v1 at0004 comment。正式な組織に限らない支援のつながり（校正 2026-09-19 で確定） |
| location of care | ケアの実施場所 | organisation.v1 misuse。参照モデルの属性で記録する場所（校正 2026-09-19 で確定） |
| network / group (organisation) | ネットワーク / 集団 | organisation.v1 keywords。法人格を持つ組織に限らない（校正 2026-09-19 で確定） |

## アーキタイプ別の確定訳（概念名）

| Archetype | at0000 text | 備考 |
|---|---|---|
| openEHR-EHR-COMPOSITION.request.v1 | 診療依頼書 | 候補：依頼書／サービス依頼。国内の「診療情報提供書」とは区別 |
| openEHR-EHR-EVALUATION.reason_for_encounter.v1 | 受診理由 | at0002 受診区分、at0004 受診時のプロブレム（主訴を同義語として明記） |
| openEHR-EHR-SECTION.referral_details.v0 | 紹介状の詳細 | at0001 紹介依頼、at0002 詳細 |
| openEHR-EHR-INSTRUCTION.service_request.v1 (1.1.2) | サービス依頼 | 緊急度の値：緊急／至急／通常 |
| openEHR-EHR-EVALUATION.problem_diagnosis.v1 (1.7.4) | プロブレム・診断 | 校正済み（2026-09-10）。重症度 軽症／中等症／重症、診断確度 疑い／推定／確定、at0046 状態 |
| openEHR-EHR-CLUSTER.problem_qualifier.v2 (2.1.1) | プロブレム・診断の修飾子 | EVALUATION.problem_diagnosis の「状態」スロット用。値セットは共通語表の各行を参照 |
| openEHR-EHR-OBSERVATION.story.v1 (1.3.3) | 病歴 | 校正済み（2026-09-11）。at0004 病歴の記述、at0006 構造化された詳細記録、at0002 任意のイベント |
| openEHR-EHR-EVALUATION.clinical_synopsis.v1 (1.0.5) | 臨床要約 | at0002 要約 |
| openEHR-EHR-SECTION.adhoc.v1 (1.0.12) | 仮見出し | 校正済み（2026-09-13）。use の例：「仮見出し」→「診察所見」 |
| openEHR-EHR-CLUSTER.symptom_sign.v2 (2.1.4) | 症状・徴候 | story.v1 のスロット。エピソード区分・発生区分・重症度・進行状況の値は problem_qualifier / problem_diagnosis と同じ |
| openEHR-EHR-CLUSTER.structured_name.v1 (1.0.3) | 人の構造化された氏名 | at0001 敬称、at0002 名、at0005 姓、at0006 接尾辞。ふりがなは comment の例示（テンプレートで CLUSTER を 2 回占有） |
| openEHR-EHR-CLUSTER.person.v1 (1.0.5) | 人 | 校正済み（2026-09-19）。at0001 氏名、at0002 構造化された氏名、at0003 識別子、at0004 役割、at0006 電子的な連絡先、at0007 組織、at0008 追加の詳細情報、at0011 ラベル（識別用の説明） |
| openEHR-EHR-CLUSTER.address.v1 (1.1.3) | 住所 | at0001 住所行、at0002 市区町村、at0003 地区／郡、at0004 都道府県／州、at0005 郵便番号、at0020 構造化された住所。日本の対応物は comment の例示 |
| openEHR-EHR-CLUSTER.electronic_communication.v1 (1.0.4) | 電子的な連絡先 | 校正済み（2026-09-19）。at0001 種別、at0002 値、at0003 用途、at0006 固定電話、at0013 追加の詳細情報 |
| openEHR-EHR-CLUSTER.organisation.v1 (1.0.4) | 組織 | 校正済み（2026-09-19）。医療機関に限らず企業・団体・部門・ケアチーム等を含む。at0001 名称、at0002 連絡担当者、at0021 親組織 |
