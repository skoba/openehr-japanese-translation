# CLAUDE.md — openehr-japanese-translation

このリポジトリは openEHR CKM 国際版アーキタイプ（ADL 1.4）に日本語（`ja`）翻訳を追加するためのものです。
成果物は `archetypes/<id>/<id>.ja.adl`（`["ja"]` ブロックを追記した ADL）で、レビュー後に CKM へアップロードします。
作業者は Claude Code / Codex などのエージェントと人間の両方です。**このファイルと `glossary-ja.md` を必ず最初に読んでください。**

## 絶対に守ること

1. **`definition` 節、他言語の翻訳、`other_details`（uid / build_uid / revision / MD5）を変更しない。** `.ja.adl` は元 ADL に `["ja"]` ブロックを追記しただけの状態でなければならない（`git diff` で追記行のみ）。書き戻しは必ず `tools/adl_i18n.rb inject` で行い、ADL を手で編集しない。
2. **用語集 `glossary-ja.md` に従う。** 用語集にある語は必ずその訳を使う。用語集にない語を新しく決めたら、使う前に用語集に追記する（同じ PR で）。
3. **迷ったら決めて、印を残す。** 訳語に複数候補があるときは一つを採用し、TSV の note 列に `要確認: 採用案（他候補: …）理由` と書く。空欄にしない。
4. **1 アーキタイプ = 1 Issue = 1 ブランチ = 1 PR。** Issue が無い翻訳作業は始めない（下記「チケット運用」）。
5. 訳文は `archetypes/<id>/fill.rb` の Ruby ハッシュに置く（再現可能・diff 可能にするため）。TSV や ADL を直接編集しない。

## 1 アーキタイプの手順

```bash
source .env                                   # 初回は tools/setup_openehr.sh
make new ADL=path/to/<id>.adl                 # archetypes/<id>/ に元 ADL・TSV・fill.rb 雛形
#   fill.rb の空文字列をすべて埋める（英文はコメントで並んでいる）
make build ID=<id>                            # fill → inject → check（自動）
make check                                    # 全 .ja.adl の検証
```

- 元 ADL は CKM からダウンロードしたもの、または https://github.com/openEHR/CKM-mirror の同一リビジョンを使う。Issue に書かれたリビジョンと `["revision"]` が一致することを確認する。
- `make build` が `FAILED` を返したら、欠けているコード／空フィールドを fill.rb に足して再実行する。`*...(en)` のようなプレースホルダを残してはいけない。
- 原文が空のフィールド（`misuse = <"">` など）は TSV に現れない。訳さなくてよい。
- 翻訳が終わったら、TSV の「要確認」行と用語集の差分を PR 本文に転記する。

## 文体・訳し方（詳細は glossary-ja.md）

- `text`（ノード名）は名詞句・句点なし。画面ラベルに使われる前提で簡潔に。
- `description` / `comment` / `purpose` / `use` / `misuse` は「〜。」で終える常体（である調）。
- 原文の段落・箇条書き・空行・末尾の改行や空白はそのまま保つ（TSV では `\n` で表現される）。
- アーキタイプ名（`COMPOSITION.encounter`）、RM クラス名、`FHIR` / `CIMI` / `HL7` などの固有名は英字のまま。
- `Tree` / `List` / `History` などの内部ノード名、`@ internal @`、CLUSTER スロット `Extension` は訳さない。`copyright` は原文どおり。
- `keywords` は原文の語に対応させ、CKM で日本語検索されそうな語を少数追加してよい。
- 括弧は全角「（）」、区切りは読点「、」。英数字は半角。原文の `'...'` は「…」に。
- 例示（"For example: ..."）は「例：…」。

## チケット運用

- スプリントの対象は `sprint/targets.tsv`（群 A〜E と差分翻訳）。`scripts/create_issues.sh` で 1 件ずつ GitHub Issue を作る（ラベル `translation`, `sprint-<群>`）。
- 作業を始める前に該当 Issue を自分にアサインし、ブランチ名は `translate/<id>`。PR タイトルは `translate: <id>`、本文に `Closes #N`。
- 対象リストに無いアーキタイプを訳す必要が出たら、先に Issue を立てて `sprint/targets.tsv` に行を足す PR を出す。
- 人間（小林）のレビュー観点は「要確認」行と用語集差分だけ。それ以外は CI（`make check`）が保証する。
- マージ後、`.ja.adl` を CKM にアップロードし、Issue に CKM の URL を書いてクローズする。CKM 上で微修正した場合は、その内容を `tools/adl_i18n.rb diff` で取り込んで用語集を更新する。

## リビジョン差分への追従

CKM 側でアーキタイプが改版されたら、新しい元 ADL で `make new` し直し、既存の `fill.rb` を流用して `make build` する。`check` が「missing in ja」を報告したコードだけ追記する。

## 既知の制約

- openehr-ruby の ADL 文法は `.v0` の archetype id を受理しない。`tools/setup_openehr.sh` が vendor 内のコピーにパッチを当てる（`V_ARCHETYPE_ID` の `[1-9][0-9]*` → `[0-9]+`）。gem 版をそのまま使う場合は v0 アーキタイプで失敗する。
- `tools/adl_i18n.rb` は CKM 出力のタブ字下げに依存して ADL のブロック境界を見つける。手で整形し直した ADL は使わない。
