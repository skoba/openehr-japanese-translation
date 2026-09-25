# スプリント B（2026-09-20 開始）

スプリント A（紹介状骨格 11 本 + symptom_sign）は 16 本すべて翻訳・校正済み（PR #39、2026-09-20）。本書はスプリント B の計画。用語の決定は glossary-ja.md、用語以外の決定は docs/decisions-ja.md が正本で、本書は着手順と段取りだけを書く。

## 対象と着手順

| 順 | Issue | Archetype | CKM 状態（2026-09-20 取得） | codes | 備考 |
|---|---|---|---|---|---|
| 1 | #46 | openEHR-EHR-OBSERVATION.body_temperature.v2 | published 2.1.10（ja あり） | 差分 | at0060 / at0061 / at0064 / at0066 の未訳のみ。at0062 Extension は訳さない |
| 2 | #47 | openEHR-EHR-OBSERVATION.body_weight.v2 | published 2.1.12（ja あり） | 差分 | at0001 / at0002 / at0008 / at0015（構造ノード。`*…(en)` を外す） |
| 3 | #48 | openEHR-EHR-OBSERVATION.blood_pressure.v2 | published 2.0.16（ja あり） | 差分 | at0007（構造ノード） |
| 4 | #44 | openEHR-EHR-EVALUATION.social_summary.v1 | published 1.1.1 | 7 | 小さい。B 群の用語の肩慣らし |
| 5 | #41 | openEHR-EHR-EVALUATION.adverse_reaction_risk.v2 | published 2.0.2 | 30 | 大物（約 160 KB）。必ず 1 本で PR。JP-CLINS AllergyIntolerance 対応 |
| 6 | #59 | openEHR-EHR-CLUSTER.anatomical_location.v1 | published 1.5.1 | 35 | problem_diagnosis / symptom_sign の「構造化された身体部位表現」スロットの本体。#42 のスロットでもあるので #42 の前に |
| 7 | #42 | openEHR-EHR-CLUSTER.adverse_reaction_event.v1 | published 1.0.2 | 26 | #41 のスロット。#41 の用語を引き継ぐ |
| 8 | #45 | openEHR-EHR-EVALUATION.infectious_disease_summary.v0 | DRAFT 0.0.1-alpha（en のみ） | 14 | v0 で改版リスク。翻訳は行うが CKM へ上げるかは別途判断 |
| 保留 | #43 | openEHR-EHR-EVALUATION.family_history.v2 | REASSESS_DRAFT 2.0.5-alpha（審査中） | 41 | alpha 版への翻訳の扱いについて CKM（Discourse）の回答が出るまで着手しない（decisions-ja.md） |

差分翻訳 3 本を先頭に置く理由: 小さく、`inject --merge`（既存 `["ja"]` を保持して未訳だけ足す）の実運用を最初に確認できるため。

## 進め方（スプリント A で固まった手順）

1. `make new ADL=sprint/adl/<id>.adl` で `archetypes/<id>/{source,work}` を作る（status は `in_progress`）。
2. Codex に docs/codex-translate-prompt.md のテンプレートで翻訳を依頼（手本: docs/style-examples.md と校正済み archetype）。Codex はコミットしない。
3. Claude Code が原文・用語集・規則と突き合わせてレビューし、Codex 納品を `Implemented-by: Codex` でコミット、修正は別コミット。`make build` → `make check`。
4. PR（1 archetype = 1 PR、base は main、`Closes #N`）。要確認は TSV の note 列と PR 本文に。
5. 校正は `work/<id>.ja.tsv` を直接直して「校正終了」→ Claude Code が `make import` で取り込み、用語集を確定に更新（`review:` コミット）。
6. マージ後、人間が CKM にアップロードして `make set-status ID=<id> STATE=uploaded CKM_URL=<url>`。
7. 群をまたぐ前に用語集の更新をマージする。

### 差分翻訳（既存 ja がある archetype）の手順

- source ADL に `["ja"] = <` があると `make build` が自動で `--merge` を付ける。既存の ja 訳と翻訳者ブロックはそのまま残り、未訳（CKM の placeholder `*…(en)`）だけが埋まる。
- fill.rb では placeholder の項目だけを埋める（scaffold は placeholder を未訳として扱う）。既存の訳文は変えない。既存訳が現行規則に反していても、この PR では直さない（別 PR で「再レビュー」として扱う）。
- 既存 ja の翻訳者は元から NPO openEHR Japan / skoba@moss.gr.jp 名義。

## 用語の事前決定（着手前に決める）

targets.md の「用語の事前決定が要るもの」のうち B 群に関わるもの。用語集にある行はそれに従い、無いものは候補を挙げる（決まったら用語集の共通語表に追加）。

| 英語 | 用語集 | 候補 / 論点 |
|---|---|---|
| adverse reaction / allergy / intolerance | 有害反応 / アレルギー / 不耐性 | problem_diagnosis の校正版に「不耐症」の箇所があるので、不耐性／不耐症のどちらに統一するかを決める |
| hypersensitivity | 未登録 | 過敏症 |
| adverse reaction risk（概念名） | 未登録 | 有害反応リスク（targets の訳語案）。「アレルギー・不耐性」を括弧で添えるかは要検討 |
| adverse reaction event（概念名） | 未登録 | 有害反応イベント |
| causative agent / substance / exposure | 未登録 | 原因物質 / 物質 / 曝露 |
| reaction / manifestation | 未登録 | 反応 / 症状（manifestation は「発現した症状」の意） |
| criticality / certainty / verification status | 未登録 | 重大性 / 確度（problem_diagnosis の「診断確度」に合わせる） / 検証状態 |
| family history / family member / relative | family member details＝家族構成員の詳細（person.v1 で確定） | 家族歴 / 家族構成員 / 親族（person.v1 use で「親族」を使用） |
| social summary / social history / lifestyle | 生活歴要約 / 生活歴 / 生活習慣 | 校正 2026-09-25 で確定（social circumstances＝生活状況） |
| infectious disease summary（概念名） | 未登録 | 感染症要約 |
| Laterality / Aspect / Anatomical Line（anatomical_location.v1） | 未登録 | 側性 / 方向 / 解剖学的基準線（要確認。他候補：左右 / 面 / 基準線）。方向用語（近位・遠位・上方・下方…）と体表の基準線は日本解剖学会『解剖学用語』の訳に合わせる。media_file の aspect＝観察方向とは別語 |

## 状態

- CKM 再アップロード待ち（#39 で訳文が変わったもの。status.tsv は PR #40 で `review` に戻す）: problem_diagnosis.v1、problem_qualifier.v2、referral_details.v0。
- INSTRUCTION.service_request.v1 の 1.1.3 は 2026-09-20 時点で未公開（REASSESS_DRAFT 1.1.2）。公開後に差分翻訳。
- family_history.v2 と infectious_disease_summary.v0 は alpha／DRAFT。着手・アップロードの判断は decisions-ja.md に記録する。
