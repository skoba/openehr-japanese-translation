#!/usr/bin/env bash
# Create one GitHub issue per sprint target from sprint/targets.tsv.
# Requires the gh CLI, authenticated, run inside the repository.
#   scripts/create_issues.sh            # all groups
#   scripts/create_issues.sh A B        # only groups A and B
# Idempotent: skips an archetype that already has an open/closed issue titled "translate: <id>".
set -euo pipefail
cd "$(dirname "$0")/.."
groups=("$@")
for l in translation sprint-A sprint-B sprint-C sprint-D sprint-E sprint-diff; do
  gh label create "$l" --force >/dev/null 2>&1 || true
done
tail -n +2 sprint/targets.tsv | while IFS=$'\t' read -r group seq id concept state codes note; do
  if [ ${#groups[@]} -gt 0 ] && ! printf '%s\n' "${groups[@]}" | grep -qx "$group"; then continue; fi
  title="translate: $id"
  if gh issue list --state all --search "in:title \"$title\"" --json title -q '.[].title' | grep -qxF "$title"; then
    echo "skip (exists): $title"; continue
  fi
  body=$(cat <<B
## 対象

- Archetype ID: \`$id\`
- 概念（訳語案）: $concept
- CKM 上の状態 / リビジョン: $state
- スプリント群: $group（#$seq）
- 用途: $note
- en term_definitions コード数: $codes

## 受け入れ条件

- [ ] \`archetypes/$id/upload/$id.adl\` が生成され、\`make check\` が通る
- [ ] 新しい訳語は \`glossary-ja.md\` に追記済み
- [ ] 迷った訳語は TSV の note 列に「要確認:」で列挙され、PR 本文にまとめてある
- [ ] レビュー後、\`upload/$id.adl\` を CKM にアップロードし、\`status.tsv\` を \`uploaded\` にした（審査依頼済み。人間が行う）
B
)
  gh issue create --title "$title" --label translation --label "sprint-$group" --body "$body"
done
