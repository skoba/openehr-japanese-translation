# AGENTS.md — openehr-japanese-translation（Codex 等のエージェント向け。内容は CLAUDE.md と同一）

このリポジトリは openEHR CKM 国際版アーキタイプ（ADL 1.4）に日本語（`ja`）翻訳を追加するためのものです。
成果物は `archetypes/<id>/upload/<id>.adl`（元 ADL に `["ja"]` ブロックを追記した ADL）で、レビュー後に CKM へアップロードします。
**CKM は元アーキタイプと同じファイル名（`<id>.adl`）でないと該当アーキタイプの翻訳として認識しない**ため、言語サフィックスを付けた別名のファイルは作らず、作業段階ごとのディレクトリ（`source/` `work/` `upload/`）と `status.tsv` で状態を区別します（下記「ディレクトリ構成と状態」）。
作業者は Claude Code / Codex などのエージェントと人間の両方です。**このファイルと `glossary-ja.md` を必ず最初に読んでください。**

## 絶対に守ること

1. **`definition` 節、他言語の翻訳、`other_details`（uid / build_uid / revision / MD5）を変更しない。** `upload/<id>.adl` は `source/<id>.adl` に `["ja"]` ブロックを追記しただけの状態でなければならない（両者の `diff` で追記行のみ）。書き戻しは必ず `tools/adl_i18n.rb inject` で行い、ADL を手で編集しない。
2. **用語集 `glossary-ja.md` に従う。** 用語集にある語は必ずその訳を使う。用語集にない語を新しく決めたら、使う前に用語集に追記する（同じ PR で）。
3. **迷ったら決めて、印を残す。** 訳語に複数候補があるときは一つを採用し、TSV の note 列に `要確認: 採用案（他候補: …）理由` と書く。空欄にしない。
5. 訳文の正本は `archetypes/<id>/work/fill.rb` の Ruby ハッシュ（再現可能・diff 可能にするため）。エージェントは `work/fill.rb` を編集する。人間の校正は `work/<id>.ja.tsv` の `target` / `note` 列を直接編集して `make import ID=<id>` で `work/fill.rb` に取り込む（下記「校正の手順」。取り込まずに `make build` すると TSV の手直しは fill.rb の内容で上書きされる）。ADL は直接編集しない。
5. 訳文は `archetypes/<id>/work/fill.rb` の Ruby ハッシュに置く（再現可能・diff 可能にするため）。TSV や ADL を直接編集しない。
6. **`status.tsv` の `uploaded` / `accepted` は人間が付ける。エージェントが状態を `uploaded` 以降に進めてはいけない**（`make set-status` を実行しない）。エージェントが動かしてよいのは `make new` / `make build` が自動で付ける `in_progress` / `review` まで。

## ディレクトリ構成と状態

```
archetypes/<id>/
  source/<id>.adl        翻訳前：CKM から取得した元 ADL（変更しない）
  work/<id>.tsv          翻訳中：抽出した英文（make new が生成）
  work/fill.rb           翻訳中：訳文（編集するのはこのファイルだけ）
  work/<id>.ja.tsv       レビュー：訳文＋note（要確認）（make build が生成）
  upload/<id>.adl        翻訳後：["ja"] を追記した ADL。CKM にはこのファイル名のままアップロード
status.tsv（リポジトリ直下）  列: archetype_id, state, revision, ckm_url, updated
```

`status.tsv` の `state` は `todo → in_progress → review → uploaded → accepted` の順に進み、後退しない（`tools/status.rb`。`FORCE=1` で上書き可）。

| state | 意味 | 誰が付けるか |
|---|---|---|
| `todo` | 対象に決まったが未着手 | 人間（`make set-status`） |
| `in_progress` | `make new` 済み。`work/fill.rb` を埋めている | `make new` が自動 |
| `review` | `make build` が通り `upload/<id>.adl` がある。PR・レビュー中、またはマージ後まだ CKM 未登録 | `make build` が自動 |
| `uploaded` | `upload/<id>.adl` を CKM にアップロード済み（審査中）。`ckm_url` にはそのアーキタイプの CKM ページ URL（`https://ckm.openehr.org/ckm/archetypes/1013.1.NNN`）を書く。翻訳が CKM に反映される前でもよい（反映後も URL は変わらない）。ベース URL（`https://ckm.openehr.org/ckm/`）は書かない | 人間（`make set-status`） |
| `accepted` | CKM で審査完了・公開済み | 人間（`make set-status`） |

`revision` は `source/<id>.adl` の `["revision"]` から自動で取る。`make status` で一覧を表示する。

## 1 アーキタイプの手順

```bash
source .env                                   # 初回は tools/setup_openehr.sh
make new ADL=path/to/<id>.adl                 # archetypes/<id>/source/ に元 ADL、work/ に TSV・fill.rb 雛形。状態 in_progress
#   work/fill.rb の空文字列をすべて埋める（英文はコメントで並んでいる）
make build ID=<id>                            # work/fill.rb → work/<id>.ja.tsv → inject → upload/<id>.adl → check（自動）。状態 review
make import ID=<id>                           # 人間の校正: work/<id>.ja.tsv を直接編集したあと、fill.rb に取り込んで build（「校正の手順」）
make check                                    # 全 archetypes/*/upload/*.adl の検証
make status                                   # status.tsv の一覧
```

- 元 ADL は CKM からダウンロードしたもの、または https://github.com/openEHR/CKM-mirror の同一リビジョンを使う。Issue に書かれたリビジョンと `["revision"]` が一致することを確認する。
- `make build` が `FAILED` を返したら、欠けているコード／空フィールドを `work/fill.rb` に足して再実行する。`*...(en)` のようなプレースホルダを残してはいけない。
- 原文が空のフィールド（`misuse = <"">` など）は TSV に現れない。訳さなくてよい。
- 翻訳が終わったら、`work/<id>.ja.tsv` の「要確認」行と用語集の差分を PR 本文に転記する。

## 校正の手順（人間が訳文をまとめて手直しするとき）

訳語を一つ二つ指すだけなら下記「レビュー反映の手順」でエージェントに任せてよいが、大幅に手直しするときは
**`work/<id>.ja.tsv` を直接編集して `make import` で取り込む**。往復は発生しない。

1. `archetypes/<id>/work/<id>.ja.tsv` をテキストエディタで開き、`target` 列（訳文）と `note` 列を直す。
   - 列は `archetype, section, code, field, context, source, target, note`（タブ区切り、1 行 1 フィールド）。`source` が原文、`target` が訳文。
   - 行の追加・削除・並べ替えはしない。`target` 以外の列も触らない。
   - 改行は `\n` と書く（原文の段落構成に合わせる）。フィールド内にタブは使えない（空白にする）。
   - 直した行の `note` の `要確認:` は消すか、決めた理由に書き換える。残っている `要確認:` はレビュー未了の印。
   - Excel は引用符や書式を勝手に付けるので使わない。VS Code などのテキストエディタ、または TSV をそのまま保存できるツールを使う。
2. `make import ID=<id>` を実行する。TSV から `work/fill.rb` を生成し直し、続けて `make build`（inject → `upload/<id>.adl` → check）まで行う。
   `git diff archetypes/<id>/work/<id>.ja.tsv` が手直しした行だけになっていれば往復は成功（`status.tsv` の状態は変わらない）。
   最初の `make import` では `work/fill.rb` が生成形式に整形し直されるため、差分が大きく見えるが訳文の内容は TSV どおり。
3. そのままコミットして PR（タイトル `review: <id> 校正`）を出す。用語集に関わる変更（他アーキタイプにも波及させたい訳語）があれば、
   PR 本文か指示に「glossary に反映して波及させて」と書く。以降はエージェントが「レビュー反映の手順」の 3〜6 を行う。

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
- マージ後、人間が `upload/<id>.adl` をそのファイル名のまま CKM にアップロードし、`make set-status ID=<id> STATE=uploaded CKM_URL=<CKM の URL>` で `status.tsv` に記録して Issue をクローズする。CKM の審査が完了したら `STATE=accepted`。CKM 上で微修正した場合は、その内容を `tools/adl_i18n.rb diff` で取り込んで用語集を更新する（下記「レビュー反映の手順」）。

## リビジョン差分への追従

CKM 側でアーキタイプが改版されたら、新しい元 ADL で `make new` し直し（`source/<id>.adl` と `work/<id>.tsv` が置き換わり、`status.tsv` の `revision` が更新される）、既存の `work/fill.rb` を流用して `make build` する。`check` が「missing in ja」を報告したコードだけ追記する。

## 既知の制約

- openehr-ruby の ADL 文法は `.v0` の archetype id を受理しない。`tools/setup_openehr.sh` が vendor 内のコピーにパッチを当てる（`V_ARCHETYPE_ID` の `[1-9][0-9]*` → `[0-9]+`）。gem 版をそのまま使う場合は v0 アーキタイプで失敗する。
- `tools/adl_i18n.rb` は CKM 出力のタブ字下げに依存して ADL のブロック境界を見つける。手で整形し直した ADL は使わない。

## レビュー反映の手順（人間の手直しを取り込むとき）

手直しは訳語の指定だけが人間の仕事。波及はエージェントが行う。
1. 変更元を特定する：PR レビューコメント／`glossary-ja.md` の直近コミット／
   `archetypes/<id>/work/ckm-reviewed.adl`（CKM から取得した修正済み ADL）に対する
   `tools/adl_i18n.rb diff archetypes/<id>/work/<id>.ja.tsv archetypes/<id>/work/ckm-reviewed.adl` の出力、／
   人間が `work/<id>.ja.tsv` を直接校正して `make import` した差分（`git diff` の `target` 列）、のいずれか。
2. 該当アーキタイプの `work/fill.rb` を直す（変更元が校正済み TSV なら `make import` 済みなので不要）。
3. 訳語の変更なら `glossary-ja.md` を更新し、備考欄に理由を一言書く。
4. 旧訳語を `grep -rn` で全 `archetypes/*/work/fill.rb` から探し、同じ意味の箇所に同じ変更を適用する。
   文脈が違って変えない箇所は PR 本文に理由を列挙する。
5. 影響したアーキタイプすべてを `make build` し、`make check` を通す（`status.tsv` が `uploaded` / `accepted` のものは `make build` しても状態は変わらない）。
6. 1 つの PR にまとめる（タイトル `review: <何を変えたか>`）。`status.tsv` が `uploaded` / `accepted` のアーキタイプは CKM に再アップロードが必要なので、CKM 再アップロード対象として PR 本文に列挙する。
