# スプリント D（2026-10-13 開始）

スプリント B（2026-09-20〜）は、保留の family_history.v2（#43）を除いて翻訳・校正・CKM アップロードまで完了した（2026-10-13 時点。infectious_disease_summary.v0 は PR #77 で校正待ち、前倒しの medication_order.v3 は PR #72 で校正待ち）。本書はスプリント D の計画。用語の決定は glossary-ja.md、用語以外の決定は docs/decisions-ja.md が正本で、本書は着手順と段取りだけを書く。

## 目的

11 月の JAMI チュートリアルで使うデモ帳票（LabResultReport / bmi_calculation / patient_blood_pressure / CardiologyEncounter / ProblemList）を構成する archetype を日本語化する。チュートリアル前に校正と CKM アップロードまで済ませたいので、小さい COMPOSITION から着手し、大物の検査 3 本は用語を先に決めてから 1 本ずつ進める。

## 対象と着手順

CKM の版は 2026-10-13 に再取得（`scripts/fetch_ckm.sh D`）。2026-09-09 の取得から版の変更なし。

| 順 | Issue | Archetype | CKM 状態 | codes | 備考 |
|---|---|---|---|---|---|
| 1 | #83 | openEHR-EHR-COMPOSITION.encounter.v1 | published 1.0.12 | 3 | patient_blood_pressure / CardiologyEncounter デモの親。encounter＝診察（用語集） |
| 2 | #84 | openEHR-EHR-COMPOSITION.problem_list.v2 | published 2.0.2 | 3 | ProblemList デモの親。Problem List＝プロブレムリスト（用語集） |
| 3 | #82 | openEHR-EHR-COMPOSITION.report.v1 | published 1.3.1 | 6 | report-result の特殊化元。report＝報告書（用語集）。先に訳して用語を report-result に引き継ぐ |
| 4 | #81 | openEHR-EHR-COMPOSITION.report-result.v1 | published 1.1.0 | 7 | report.v1 の特殊化。LabResultReport / bmi_calculation デモの親。#82 の直後に |
| 5 | #85 | openEHR-EHR-OBSERVATION.height.v2 | published 2.1.1 | 15 | BMI デモ。body_weight.v2（既存 ja）の訳語（測定、機器、測定部位）を引き継ぐ |
| 6 | #86 | openEHR-EHR-OBSERVATION.body_mass_index.v2 | published 2.1.0 | 15 | BMI デモ。#85 の直後に |
| 7 | #78 | openEHR-EHR-OBSERVATION.laboratory_test_result.v1 | published 1.2.8 | 41 | 大物（約 255 KB）。必ず 1 本で PR。検体・検査項目の SLOT の親なので先に訳す |
| 8 | #79 | openEHR-EHR-CLUSTER.laboratory_test_analyte.v1 | published 1.2.3 | 23 | #78 の「Test result」SLOT。#78 の用語を引き継ぐ |
| 9 | #80 | openEHR-EHR-CLUSTER.specimen.v1 | published 1.1.3 | 43 | 大物（約 160 KB）。#78 の「Specimen detail」SLOT。感染症検体検査にも |

順 1〜6 はいずれも小さいので、校正が追いつく範囲で続けて PR を出してよい（1 archetype = 1 PR は変えない）。順 7〜9 は「用語の事前決定」を済ませてから着手する。

## 進め方（スプリント A・B で固まった手順）

1. `make new ADL=sprint/adl/<id>.adl` で `archetypes/<id>/{source,work}` を作る（status は `in_progress`）。
2. 翻訳は Claude Code が直接行う（この環境に Codex なし。Codex に依頼する場合は docs/codex-translate-prompt.md）。手本は docs/style-examples.md と校正済み archetype（同じ構文は同じ訳し方）。
3. 原文・用語集・規則と突き合わせて `make build` → `make check`。
4. PR（1 archetype = 1 PR、base は main、`Closes #N`）。要確認は TSV の note 列と PR 本文に。
5. 校正は `work/<id>.ja.tsv` を直接直して「校正終了」→ Claude Code が `make import` で取り込み、用語集を確定に更新（`review:` コミット）。手を入れなかった要確認行は採用案で確定し note を消す。
6. マージ後、人間が CKM にアップロードして `make set-status ID=<id> STATE=uploaded CKM_URL=<url>`。status の変更は status 用ブランチ（`status/<id>-uploaded`）の PR で main に入れる。複数まとめてよい。
7. 群をまたぐ前に用語集の更新をマージする。

## 用語の事前決定（順 7〜9 の着手前に決める）

targets.md「用語の事前決定が要るもの」のうち D 群に関わるもの。用語集にある行はそれに従い、無いものは候補を挙げる（決まったら用語集の共通語表に追加）。

| 英語 | 用語集 | 候補 / 論点 |
|---|---|---|
| laboratory test result（概念名） | 臨床検査結果 | 用語集どおり |
| specimen | 検体 | targets の訳語案。「標本」は病理に限るので使わない |
| analyte / laboratory test analyte（概念名） | 未登録 | 検査項目 / 検査項目結果（targets の訳語案）。分析物は使わない |
| panel / test panel | 未登録 | パネル（他候補: 検査セット、検査パネル） |
| reference range / normal range | 未登録 | 基準範囲 / 正常範囲（JCCLS の「基準範囲」に合わせる） |
| result status（registered / partial / final / amended / cancelled …） | 未登録 | 結果状態。値は JP Core Observation.status の訳に合わせるか要検討 |
| test name / analyte name | 未登録 | 検査名 / 検査項目名 |
| report（概念名） / result report（概念名） | 報告書 | 報告書 / 結果報告書（targets の訳語案） |
| encounter（概念名） | 診察 | 用語集どおり（reason_for_encounter＝受診理由の例外は変えない） |
| problem list（概念名） | プロブレムリスト | 用語集どおり |
| height / length | 未登録 | 身長 / 身長（臥位）。targets の「身長（立位/臥位）」。乳児の length は「身長（臥位）」 |
| body mass index（概念名） | 未登録 | BMI（targets の訳語案。「体格指数」は括弧で添えるか要検討） |

## 状態

- 校正待ち: PR #72 medication_order.v3（要確認 24 件）、PR #77 infectious_disease_summary.v0（要確認 7 件。CKM アップロードは別途判断）。
- 保留: family_history.v2（#43、alpha 版への翻訳の扱いについて CKM 側の回答待ち）、service_request.v1 の 1.1.3 差分（#51 の `make update` と CKM 公開待ち）。
- C 群の残り（#67〜#70）は構造化用法をテンプレートに足す段階で着手（PR #71）。
- E 群（pulse / respiration / pulse_oximetry）は 12 月公開の基本セット向け。D 群の後。
