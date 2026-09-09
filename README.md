# openehr-japanese-translation

openEHR CKM 国際版アーキタイプの日本語翻訳スプリント。NPO 日本 openEHR 協会（openEHR.jp）の活動として、
紹介状（診療情報提供書）を構成するアーキタイプ群を起点に、JAMI チュートリアルと年内公開に必要な基本セットまでを対象とする。

- 対象と優先順位：`sprint/targets.md`（人間向け）／`sprint/targets.tsv`（Issue 生成用）
- 用語集・文体規則：`glossary-ja.md`
- 作業手順・ポリシー：`CLAUDE.md`（Claude Code 用。`AGENTS.md` は同内容の Codex 用）
- 運用の詳細：`docs/workflow.md`

## 成果物

`archetypes/<archetype id>/`

| ファイル | 内容 |
|---|---|
| `<id>.adl` | CKM からダウンロードした元 ADL（変更しない） |
| `<id>.tsv` | 翻訳対象の文字列を 1 行 1 フィールドに抽出したもの（`make new` が生成） |
| `fill.rb` | 日本語訳を Ruby ハッシュで持つ。**編集するのはこのファイルだけ** |
| `<id>.ja.tsv` | 訳文と note（要確認）を埋めた TSV。レビュー用 |
| `<id>.ja.adl` | `["ja"]` ブロックを追記した ADL。**CKM にアップロードするもの** |

## セットアップ

```bash
bundle install            # openehr-ruby の依存 gem
tools/setup_openehr.sh    # openehr-ruby を vendor/ に取得し、.v0 対応パッチを適用
source .env
make check                # 既存の .ja.adl がすべて通れば準備完了
```

## 1 本訳す

```bash
make new ADL=~/Downloads/openEHR-EHR-CLUSTER.organisation.v1.adl
$EDITOR archetypes/openEHR-EHR-CLUSTER.organisation.v1/fill.rb
make build ID=openEHR-EHR-CLUSTER.organisation.v1
```

`make build` は訳文の書き戻しと検証（en と ja の at/ac コード集合と全フィールドの一致）まで行う。
通ったら PR を出し、レビュー後に `.ja.adl` を CKM の翻訳アップロードから登録する。

## チケット運用

`scripts/create_issues.sh`（`gh` CLI が必要）で `sprint/targets.tsv` の各行を GitHub Issue にする。
1 アーキタイプ = 1 Issue = 1 ブランチ（`translate/<id>`）= 1 PR（`Closes #N`）。詳細は `CLAUDE.md`。

## ライセンス

- `archetypes/` と `glossary-ja.md`：翻訳の対象となるアーキタイプは openEHR Foundation の著作物で CC BY-SA 3.0/4.0 の下で提供されている。翻訳は二次的著作物なので同じ条件、**CC BY-SA 4.0** で提供する（`archetypes/LICENSE.md`）。
- それ以外（`tools/`、`scripts/`、`Makefile`、CI 設定、文書）：**Apache License 2.0**（リポジトリ直下の `LICENSE`。openehr-ruby と同じ）。
