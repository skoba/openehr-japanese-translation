# Contributing

## 翻訳への貢献とライセンス

- `archetypes/` 以下の翻訳（`["ja"]` ブロック、`upload/<id>.adl`、`work/*.tsv`、`work/fill.rb`）と `glossary-ja.md` は、
  元アーキタイプと同じ **CC BY-SA 4.0** で公開します（`archetypes/LICENSE.md`）。
- openEHR Foundation は、HL7 FHIR とのハーモナイズのため、仕様およびアーキタイプを将来 **CC0** に
  移行する可能性を示しています。翻訳は元アーキタイプの二次的著作物なので、元がより緩い条件になれば
  翻訳も同じ条件で再公開できるようにしておく必要があります。
- そのため、このリポジトリに翻訳を寄与する人は、次に同意したものとします：

  > 私が寄与した翻訳は、CC BY-SA 4.0 で公開されることに加え、openEHR Foundation が元アーキタイプに
  > 適用するライセンスが将来変更された場合（CC0 1.0 を含む）、NPO 日本 openEHR 協会の判断により
  > 同じライセンスで再公開されることに同意します。

  PR を出すことで上記に同意したものとみなします。エージェント（Claude Code / Codex 等）が生成した
  翻訳は、PR を出した人の寄与として扱います。

- ツール類（`tools/`、`scripts/`、Makefile、CI、文書）への貢献は Apache License 2.0 です。

## 作業の進め方

`CLAUDE.md`（Claude Code 用）／`AGENTS.md`（Codex 用）と `docs/workflow.md` を参照してください。
1 アーキタイプ = 1 Issue = 1 ブランチ = 1 PR が原則です。
