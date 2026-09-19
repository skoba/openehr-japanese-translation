# Codex への翻訳依頼プロンプト（テンプレート）

`<ID>` と `<N>` を置き換え、`codex exec -s workspace-write -C <リポジトリ> - < prompt.md` で渡す（起動前に `pwd` で対象リポジトリを確認する。Codex はコミットしない。差分は Claude Code がレビューし、`Implemented-by: Codex` トレーラ付きでコミットする）。

---

あなたはこのリポジトリ（openehr-japanese-translation）の翻訳担当エージェントです。最初に次を読んでください。
1. AGENTS.md（規則）
2. glossary-ja.md（訳語。特に「文体規則」と「こなれた訳のための規則」）
3. docs/decisions-ja.md（用語以外の決定事項）
4. docs/style-examples.md（校正前 → 校正後の対応。**NEW の方向で訳す**。同じ構文の英文は同じ言い回しにそろえる）

## 課題
Issue #<N>: openEHR-EHR-<ID> の日本語訳。`make new` は実行済みで、次のファイルがあります。
- archetypes/openEHR-EHR-<ID>/work/openEHR-EHR-<ID>.tsv（抽出された英文。列: archetype, section, code, field, context, source, target, note）
- archetypes/openEHR-EHR-<ID>/work/fill.rb（雛形。T の空文字列 '' をすべて訳で埋め、NOTES に迷った訳語の「要確認: 採用案（他候補: …）理由」を書く）

## やること
1. fill.rb の T をすべて埋める（原文が空の description は '' のまま）。原文の段落・改行（\n）・箇条書き・末尾の空白は保つ。
2. 訳語は glossary-ja.md にある語を必ず使う。確定済みの語（例）: data element＝データエレメント、archetype は英字のまま、Comment＝コメント、Additional details＝追加の詳細情報、subject of care＝ケア対象者、healthcare provider＝医療従事者、problem＝プロブレム、Extension・Tree は訳さない。用語集に無い語は決めて NOTES に要確認を残し、glossary-ja.md の共通語表の末尾と概念名表の末尾に行を追加する（既存行は変更しない）。
3. 検証: `export PATH="$HOME/.rbenv/shims:$PATH"; source .env; make build ID=openEHR-EHR-<ID>` が `OK: … [ja] complete` になるまで直し、`make check` が全件 OK であることを確認する。
4. git commit / push / PR はしない。status.tsv は make build に任せる。
5. 最後に、要確認にした訳語と用語集に追加した行を簡潔に報告する。
