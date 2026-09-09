# 運用手順（人間向け）

## 全体の流れ

1. `sprint/targets.tsv` に対象を並べ、`scripts/create_issues.sh` で Issue を作る（群ごとに `sprint-A` などのラベル）。
2. エージェント（Claude Code / Codex）または人が Issue を取り、`translate/<id>` ブランチで `make new` → `fill.rb` を埋める → `make build`。
3. PR を出す。本文には「要確認」行と用語集差分を転記する。CI（`.github/workflows/check.yml`）が全 `.ja.adl` を検証する。
4. 小林先生が「要確認」行と用語集差分だけをレビューし、必要なら訳語を指示 → エージェントが `fill.rb` を直して再 build。
5. マージ後、`archetypes/<id>/<id>.ja.adl` を CKM の翻訳アップロードから登録し、Issue に CKM の URL を書いてクローズ。
6. CKM 上で微修正した場合は、CKM からダウンロードした ADL（審査完了後）または翻訳画面のテキストを使って `tools/adl_i18n.rb diff <id>.ja.tsv <ckm>.adl` を取り、差分を `fill.rb` と用語集に反映する。

## エージェントに一括で頼むとき

用語のぶれを防ぐため、**一度に渡すのは同じ群の中の数本まで**にし、群をまたぐときは用語集の更新をマージしてから次へ進む。

指示の例（Claude Code）：

```
CLAUDE.md と glossary-ja.md を読んでから、Issue #12〜#16（sprint-B）を順に処理してください。
各 Issue について translate/<id> ブランチを切り、CKM-mirror から該当リビジョンの ADL を取得して
make new → fill.rb → make build を通し、PR を出してください。新しい訳語は必ず glossary-ja.md に追記し、
迷った訳語は note に「要確認:」を残してください。1 つの PR に 1 アーキタイプだけ含めてください。
```

大物（medication_order、laboratory_test_result、problem_diagnosis、adverse_reaction_risk、family_history、specimen、problem_qualifier）は必ず 1 本ずつ。

## 用語集の育て方

- 決定した訳語は `glossary-ja.md` の「共通語」表に 1 行で追加する（English / 日本語 / 備考）。
- 概念名（at0000）は「アーキタイプ別の確定訳」表に追加する。
- 既存の訳語を変更したら、その語を使っている既訳アーキタイプの `fill.rb` も同じ PR で直し、`make build` し直す（`grep -l` で探す）。
- 用語集の編集は Git 上で行う。Google ドキュメント等でのコピー編集は重複の原因になるので避ける。

## CKM との往復

- CKM の翻訳アップロードには、`inject` が生成した `.ja.adl`（CRLF・BOM を保持した版）をそのまま使う。元 ADL と同じリビジョンであること。
- CKM で再評価中（trunk が alpha）のアーキタイプは、公開版のリビジョンで翻訳し、次の公開時に差分だけ追加する（`make new` し直して `check` の「missing」を埋める）。
- CKM の翻訳は審査完了まで公開・ダウンロードされない。差分回収は翻訳画面のテキストか、公開後のダウンロードで行う。

## 翻訳者情報

`inject` の `--author` 等は Makefile の `AUTHOR` / `ORG` / `EMAIL` で指定する（既定：Shinji Kobayashi / Gifu University）。
NPO 名義にする場合は `ORG="NPO openEHR Japan"` を渡す。
