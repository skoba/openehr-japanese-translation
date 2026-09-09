#!/usr/bin/env bash
# Download archetype ADLs from the openEHR CKM REST API.
#   scripts/fetch_ckm.sh                                # every row of sprint/targets.tsv
#   scripts/fetch_ckm.sh A B                            # only groups A and B
#   scripts/fetch_ckm.sh openEHR-EHR-CLUSTER.person.v1  # explicit archetype ids (latest published)
# Output: sprint/adl/<id>.adl and sprint/adl/manifest.tsv (cid / status / revision / asset version).
# Rows whose ckm_state starts with "published" get the latest *published* revision;
# anything else (in_development, ...) gets the latest revision on the trunk.
# Next step: make new ADL=sprint/adl/<id>.adl
set -euo pipefail
cd "$(dirname "$0")/.."
BASE=https://ckm.openehr.org/ckm/rest/v1
OUT=sprint/adl
MANIFEST=$OUT/manifest.tsv
mkdir -p "$OUT"
[ -f "$MANIFEST" ] || printf 'archetype_id\tcid\tstatus\trevision\tasset_version\tfetched_at\n' > "$MANIFEST"

fetch() { # <archetype id> <true|false: latest published only>
  local id=$1 published=$2 cid q json status rev ver
  # citeable-identifier is text/plain only (Accept: application/json -> 406)
  cid=$(curl -sfS "$BASE/archetypes/citeable-identifier/$id" | tr -d '"\r\n ')
  [ -n "$cid" ] || { echo "ERROR: no citeable id for $id" >&2; return 1; }
  q=""; [ "$published" = true ] && q="get-latest-published=true"
  json=$(curl -sfS -H "Accept: application/json" "$BASE/archetypes/$cid?$q")
  status=$(printf '%s' "$json" | sed -n 's/.*"status":"\([^"]*\)".*/\1/p')
  rev=$(printf '%s' "$json" | sed -n 's/.*"revision":"\([^"]*\)".*/\1/p')
  ver=$(printf '%s' "$json" | sed -n 's/.*"versionAsset":\([0-9]*\).*/\1/p')
  curl -sfS "$BASE/archetypes/$cid/adl?$q" -o "$OUT/$id.adl"
  grep -q "^	$id" "$OUT/$id.adl" || { echo "ERROR: $OUT/$id.adl does not contain archetype id $id" >&2; return 1; }
  { head -1 "$MANIFEST"; { tail -n +2 "$MANIFEST" | grep -v "^$id	" || true; } ; \
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$id" "$cid" "$status" "$rev" "$ver" "$(date -u +%Y-%m-%dT%H:%MZ)"; } \
    | { read -r h; echo "$h"; sort; } > "$MANIFEST.tmp"
  mv "$MANIFEST.tmp" "$MANIFEST"
  echo "$id  cid=$cid  $status $rev (asset $ver)  -> $OUT/$id.adl"
}

if [ $# -gt 0 ] && [[ $1 == openEHR-* ]]; then
  for id in "$@"; do fetch "$id" true; done
  exit 0
fi

groups=("$@")
tail -n +2 sprint/targets.tsv | while IFS=$'\t' read -r group seq id concept state rest; do
  if [ ${#groups[@]} -gt 0 ] && ! printf '%s\n' "${groups[@]}" | grep -qx "$group"; then continue; fi
  case "$state" in published*) pub=true ;; *) pub=false ;; esac
  fetch "$id" "$pub"
done
