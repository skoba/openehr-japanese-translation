# スプリント対象と優先順位

出典：Claude プロジェクト「NPO openEHR Japan」の優先リスト v1（2026-09-09、openEHR/CKM-mirror 2026-09-03 時点の集計）。
済み：COMPOSITION.request.v1、EVALUATION.reason_for_encounter.v1、SECTION.referral_details.v0、INSTRUCTION.service_request.v1（1.1.2、1.1.3 公開時に差分）。

優先順位：A・B・C（jp_referral 骨格に今必要）→ D（11 月 JAMI チュートリアルのデモ帳票）→ E（12 月公開の基本セット）。スロット依存の CLUSTER は親と同じ段で扱う。


## A. 紹介状骨格の残り

| # | Archetype | 概念（訳語案） | 状態 | codes | 備考 |
|---|---|---|---|---|---|
| 1 | openEHR-EHR-EVALUATION.problem_diagnosis.v1 | 問題/診断（傷病名） | published 1.7.4 | 27 | 傷病名・過去の病名。ProblemList デモでも使用。スロット: problem_qualifier, anatomical_location |
| 2 | openEHR-EHR-CLUSTER.problem_qualifier.v2 | 問題/診断修飾子 | published 2.1.1 | 52 | 既往/現在、疑い、主/副、エピソード等。値セットが多い |
| 3 | openEHR-EHR-OBSERVATION.story.v1 | 病歴/経過 | published | 8 | 症状経過（現病歴）・既往歴 narrative |
| 4 | openEHR-EHR-EVALUATION.clinical_synopsis.v1 | 臨床要約 | published | 5 | 治療経過 |
| 5 | openEHR-EHR-SECTION.adhoc.v1 | 任意見出し | published | 1 | 傷病名・主訴／既往歴・家族歴／備考の節。ほぼ全テンプレートで使用 |
| 6 | openEHR-EHR-CLUSTER.organisation.v1 | 組織（医療機関/部門） | published 1.0.4 | 10 | 紹介先・紹介元機関（service_request の receiver/requester スロット） |
| 7 | openEHR-EHR-CLUSTER.person.v1 | 人 | published 1.0.5 | 12 | 紹介先担当医・紹介元医師・患者 |
| 8 | openEHR-EHR-CLUSTER.structured_name.v1 | 構造化氏名 | published | 5 | 漢字/カナ表記の扱いは占有 2 回で対応を検討 |
| 9 | openEHR-EHR-CLUSTER.address.v1 | 住所 | published | 22 | 郵便番号・都道府県の対応付けを use に注記 |
| 10 | openEHR-EHR-CLUSTER.electronic_communication.v1 | 電子的連絡先 | published | 14 | 電話・FAX・メール |
| 11 | openEHR-EHR-CLUSTER.media_file.v1 | メディアファイル | published | 10 | 添付資料。service_request / person / lab / family_history のスロットにも入る |

## B. 「既往歴及び家族歴」欄

| # | Archetype | 概念（訳語案） | 状態 | codes | 備考 |
|---|---|---|---|---|---|
| 12 | openEHR-EHR-EVALUATION.adverse_reaction_risk.v2 | 有害反応リスク（アレルギー・不耐性） | published 2.0.2 | 30 | JP-CLINS AllergyIntolerance 対応 |
| 13 | openEHR-EHR-CLUSTER.adverse_reaction_event.v1 | 有害反応イベント | published | 26 | 12 のスロット |
| 14 | openEHR-EHR-EVALUATION.family_history.v2 | 家族歴要約 | in_development 2.0.5-alpha（審査中） | 41 | 骨格必須。公開時に差分追従が要る前提で着手 |
| 15 | openEHR-EHR-EVALUATION.social_summary.v1 | 社会歴要約（生活歴） | published | 7 | 小さい |
| 16 | openEHR-EHR-EVALUATION.infectious_disease_summary.v0 | 感染症要約 | in_development v0（en のみ） | 14 | 骨格 No.17。v0 なので改版リスクあり |

## C. 現在の処方

| # | Archetype | 概念（訳語案） | 状態 | codes | 備考 |
|---|---|---|---|---|---|
| 17 | openEHR-EHR-INSTRUCTION.medication_order.v3 | 薬剤オーダー | published 3.2.1 | 57 | 最大（約 18k 字）。JP-CLINS MedicationRequest 対応 |
| 18 | openEHR-EHR-CLUSTER.medication.v2 | 薬剤詳細 | published | 25 | 17 のスロット |
| 19 | openEHR-EHR-CLUSTER.therapeutic_direction.v1 | 治療指示 | published | 12 | 17 のスロット。dosage / timing を束ねる |
| 20 | openEHR-EHR-CLUSTER.dosage.v2 | 用量 | published | 9 | 19 のスロット |
| 21 | openEHR-EHR-CLUSTER.timing_daily.v1 | 服用タイミング（日内） | published | 15 | 20 のスロット。「1日3回毎食後」などの用法 |

## D. 検査結果報告書と JAMI チュートリアルのデモ帳票

| # | Archetype | 概念（訳語案） | 状態 | codes | 備考 |
|---|---|---|---|---|---|
| 22 | openEHR-EHR-OBSERVATION.laboratory_test_result.v1 | 臨床検査結果 | published 1.2.8 | 41 | 紹介状の検査結果欄＋LabResultReport デモ |
| 23 | openEHR-EHR-CLUSTER.laboratory_test_analyte.v1 | 検査項目結果 | published | 23 | 22 のスロット |
| 24 | openEHR-EHR-CLUSTER.specimen.v1 | 検体 | published | 43 | 22 のスロット。感染症検体検査にも |
| 25 | openEHR-EHR-COMPOSITION.report-result.v1 | 結果報告書 | published | 7 | LabResultReport / bmi_calculation デモの親 |
| 26 | openEHR-EHR-COMPOSITION.report.v1 | 報告書 | published | 6 | 25 の親アーキタイプ（特殊化元） |
| 27 | openEHR-EHR-COMPOSITION.encounter.v1 | 診察 | published | 3 | patient_blood_pressure / CardiologyEncounter デモ |
| 28 | openEHR-EHR-COMPOSITION.problem_list.v2 | 問題リスト | published | 3 | ProblemList デモ |
| 29 | openEHR-EHR-OBSERVATION.height.v2 | 身長（立位/臥位） | published | 15 | BMI デモ |
| 30 | openEHR-EHR-OBSERVATION.body_mass_index.v2 | BMI | published | 15 | BMI デモ |

## E. バイタルサインの残り

| # | Archetype | 概念（訳語案） | 状態 | codes | 備考 |
|---|---|---|---|---|---|
| 31 | openEHR-EHR-OBSERVATION.pulse.v2 | 脈拍/心拍 | published | 50 | デモの heart_rate-pulse.v1（旧）を置換 |
| 32 | openEHR-EHR-OBSERVATION.respiration.v2 | 呼吸 | published | 31 |  |
| 33 | openEHR-EHR-OBSERVATION.pulse_oximetry.v1 | パルスオキシメトリ | published | 24 |  |

## 差分翻訳（既存 ja の未訳項目）

| # | Archetype | 概念（訳語案） | 状態 | codes | 備考 |
|---|---|---|---|---|---|
| 34 | openEHR-EHR-OBSERVATION.body_temperature.v2 | 体温（差分翻訳） | published（ja あり） | — | at0060 / at0061 / at0064 / at0066 の未訳項目（at0062 Extension は訳さない） |
| 35 | openEHR-EHR-OBSERVATION.body_weight.v2 | 体重（差分翻訳） | published（ja あり） | — | at0001 / at0002 / at0008 / at0015（構造ノード。`*` を外す） |
| 36 | openEHR-EHR-OBSERVATION.blood_pressure.v2 | 血圧（差分翻訳） | published（ja あり） | — | at0007（構造ノード） |

## 用語の事前決定が要るもの

- problem / diagnosis / condition の訳し分け（問題/診断/病態）、problem qualifier の active/inactive/resolved、current/past
- adverse reaction / allergy / intolerance / hypersensitivity（有害反応/アレルギー/不耐性/過敏症）
- medication order の course / therapeutic direction / dosage / administration / dispense（コース/治療指示/用量/投与/調剤）
- specimen / analyte / panel / reference range（検体/検査項目/パネル/基準範囲）
- person / individual / subject / healthcare provider（既存：ケア対象者・医療従事者）と organisation の部門表現
