# 決定事項（用語以外）— 正本

用語の決定は `glossary-ja.md` が正本。ここには翻訳者情報・運用方針・ローカライズ方針・CKM への提案状況など、用語以外の決定を置く。エージェントは作業開始時に本ファイルを読む。決定が変わったら本ファイルを同じ PR で更新する。

## 翻訳者情報（2026-09-11 統一）

- `translations["ja"]` の author は **Shinji KOBAYASHI / NPO openEHR Japan / skoba@moss.gr.jp** で統一する（Makefile の `AUTHOR` / `ORG` / `EMAIL` 既定値）。
- 旧表記（Shinji Kobayashi / Gifu University / shnj.kobayashi@gmail.com）で build 済みの `upload/<id>.adl` は再 build して翻訳者ブロックを更新する。訳文は変えない（build 前後の diff が翻訳者ブロックのみであることを確認する）。
- CKM にアップロード済みのもの（`status.tsv` が `uploaded`）は、翻訳者ブロックを直した ADL を再アップロードする。再アップロード対象は PR 本文に列挙する。
- CKM 上の既存 ja 訳（OBSERVATION.blood_pressure.v2 / body_weight.v2 / body_temperature.v2）は元から NPO openEHR Japan / skoba@moss.gr.jp 名義。`inject --merge` は翻訳者ブロックに触らない。

## 対象と優先順位

- 対象は `sprint/targets.tsv`（A〜E 群 35 本＋差分 3 本。#37 CLUSTER.symptom_sign.v2 は story.v1 の直後に着手）。対象外を訳すときは先に Issue と targets.tsv への追加 PR。
- 大物（medication_order / symptom_sign / laboratory_test_result / problem_diagnosis / adverse_reaction_risk / family_history / specimen / problem_qualifier）は必ず 1 本ずつ。群をまたぐ前に用語集の更新をマージする。
- EVALUATION.family_history.v2（2.0.5-alpha、審査中）は、alpha 版への翻訳の扱いについて CKM 側（Discourse）の回答が出るまで着手しない。
- INSTRUCTION.service_request.v1 は 1.1.3 公開後に差分翻訳する（2026-09-20 時点で未公開、REASSESS_DRAFT 1.1.2）。 2026-09-20 に 1.1.2 ベースの訳を CKM にアップロードしようとしたところ、current branch が審査中の次版で at0144/45/47 削除・at0154〜58 追加・use 全面改訂の警告が出たため Commit せず中止。公開後に `make update`（Issue #51）で版上げして再訳する。
- スプリント B（2026-09-20〜）の着手順は docs/sprint-B.md。差分翻訳 3 本 → social_summary → adverse_reaction_risk → anatomical_location（#38、Issue #59）→ adverse_reaction_event → medication_order（#17、Issue #66。C 群から前倒し）→ infectious_disease_summary（v0）。family_history.v2 は保留のまま。
- jp_referral の「現在の処方」は INSTRUCTION.medication_order.v3 を最小構成（Medication item、Overall directions description、Specific directions description、Order start date/time、Clinical indication、Comment の 6 ノード）で使う。構造化用法（#18〜#21）は後から任意ノードとして足す（2026-09-25）。

## status.tsv と CKM の審査状態

- CKM は翻訳入り ADL のアップロードを受け付ける（元と同じファイル名 `<id>.adl` が必須）。build_uid / revision は CKM が管理する。
- `status.tsv` は CKM の審査状態を自動では追わない。セッション開始時に `make status` を実行し、`uploaded` が残っていれば CKM で accepted になったかを人間に確認するよう促す。accepted なら `make set-status ID=<id> STATE=accepted CKM_URL=<url>` と Issue クローズを提案する（状態を付けるのは人間）。

## ローカライズ方針（2026-09-11）

- Demographics 系（CLUSTER.address.v1 / CLUSTER.person.v1 / CLUSTER.structured_name.v1 / CLUSTER.organisation.v1）は翻訳だけでは完結しない。住所の表記規則、氏名・住所・医療機関名のふりがな（表記種別）は、**NPO openEHR Japan で使う分はローカライズで対応する**。国際版への変更要求（CR）は並行して出すが、採否・時期は読めないので待たない。
- 国際アーキタイプの特殊化（ADL の `<概念名>-<特殊化名>` 記法。旧 MML の `-japan` はこれ）は作らない。新しいデータ要素が要るときは、既存スロット（address.v1 の Structured address、person.v1 / organisation.v1 の Additional details）に挿す新規 CLUSTER（概念名＋`_jp`）か、CKM への CR で解決する。
- 翻訳層でできるのは、comment に日本の対応物を例示すること（「例：都道府県」「例：市区町村」）まで。原文の意味は変えない。
- 詳細は `docs/localisation-ja.md`。

## CKM への提案（CR）

- structured_name.v1 への Representation（表記種別：ideographic / syllabic / alphabetic、phonetic は議論用）追加と、organisation.v1 の代替名称。文案は `docs/cr-name-representation.md`。状態：提出済み（CR 1013.36.1512：https://ckm.openehr.org/ckm/archetypes/1013.1.5359/changerequests/1013.36.1512 。editor の回答待ち）。

## 経緯の記録

- 2026-09-06：紹介状群（request / reason_for_encounter / referral_details / service_request）から着手。用語集の起点。
- 2026-09-09：スプリント化。リポジトリ作成。翻訳スプリントの優先リスト（34 本＋差分 3 本）。
- 2026-09-10：problem_diagnosis.v1 を CKM へアップロード。ディレクトリ構成を段階別に改訂。
- 2026-09-11：problem_qualifier.v2 を CKM へアップロード。story.v1（病歴）校正。symptom_sign.v2 を A 群に追加。`inject --merge` 追加。翻訳者情報を NPO 名義に統一。ローカライズ方針決定。
- 2026-09-19〜20：A 群の残り（person / structured_name / address / electronic_communication / organisation / media_file）を Codex 翻訳＋校正。翻訳済み 16 本を現行規則で再レビューし全本校正（PR #39）。校正で clinician＝医療従事者、transfer of care＝診療の引き継ぎ、Structured name＝構造化された人名、Occurrence＝発症区分、Resolving factor＝消失因子、ad hoc の定型を決定。スプリント B の Issue #41〜#48 を作成。
- 2026-09-21：CLUSTER.anatomical_location.v1（1.5.1）を対象 #38 として追加（Issue #59。adverse_reaction_risk の後、adverse_reaction_event の前に着手）。structured_name.v1 の Representation CR を CKM に提出（1013.36.1512、editor の回答待ち）。
- 2026-09-25：INSTRUCTION.medication_order.v3（3.2.1、57 コード）を C 群から前倒し（Issue #66。adverse_reaction_event の後）。C 群の Issue #66〜#70 を作成。jp_referral「現在の処方」は medication_order の最小構成 6 ノードで表す（JP-CLINS 430 JP_MedicationRequest_eCS 対応）。intolerance＝不耐症に決定（adverse_reaction_risk #65）。
