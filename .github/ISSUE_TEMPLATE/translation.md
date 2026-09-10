---
name: アーキタイプ翻訳
about: 1 アーキタイプの日本語翻訳チケット
title: "translate: openEHR-EHR-XXX.yyy.vN"
labels: translation
---

## 対象

- Archetype ID:
- CKM 上の状態 / リビジョン:
- スプリント群（A〜E / 差分）:
- 用途（どのテンプレート・帳票で使うか）:

## 受け入れ条件

- [ ] `archetypes/<id>/upload/<id>.adl` が生成され、`make check` が通る
- [ ] 新しい訳語は `glossary-ja.md` に追記済み
- [ ] 迷った訳語は TSV の note 列に「要確認:」で列挙され、PR 本文にまとめてある
- [ ] レビュー後、`upload/<id>.adl` を CKM にアップロードし、`status.tsv` を `uploaded` にした（審査依頼済み。人間が行う）

## メモ
