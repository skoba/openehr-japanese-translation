#!/usr/bin/env bash
# Set up the openehr-ruby parser used by tools/adl_i18n.rb.
#
# Preferred: `gem install openehr` (or `bundle install`) and nothing else.
# Fallback (and what CI does): clone openehr-ruby from GitHub into vendor/ and
# apply a one-line grammar patch so that development archetypes (`.v0`) parse.
# Upstream issue candidate: V_ARCHETYPE_ID in adl_grammar.tt only accepts
# `.v[1-9][0-9]*`, so every CKM v0 archetype fails with "Invalid ADL".
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p vendor
if [ ! -d vendor/openehr-ruby ]; then
  git clone --depth 1 https://github.com/skoba/openehr-ruby.git vendor/openehr-ruby
fi
G=vendor/openehr-ruby/lib/openehr/parser/adl_grammar.tt
if grep -q "'.v' \[1-9\] \[0-9\]\*" "$G"; then
  sed -i "s/'.v' \[1-9\] \[0-9\]\*/'.v' [0-9]+/" "$G"
  echo "patched $G to accept .v0 archetype ids"
fi
echo "export ADL_I18N_LIBS=\"$(pwd)/vendor/openehr-ruby/lib\"" > .env
echo "export LANG=C.UTF-8 RUBYOPT=-Eutf-8" >> .env
echo "wrote .env - run: source .env"
