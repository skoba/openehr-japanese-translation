#!/usr/bin/env bash
# Set up the openehr-ruby parser used by tools/adl_i18n.rb.
#
# Preferred: `gem install openehr` (or `bundle install`) and nothing else.
# Fallback (and what CI does): clone openehr-ruby from GitHub into vendor/ and
# apply a one-line grammar patch so that development archetypes (`.v0`) parse.
# Upstream issue: https://github.com/skoba/openehr-ruby/issues/50 (V_ARCHETYPE_ID only accepts
# `.v[1-9][0-9]*`, so every CKM v0 archetype fails with "Invalid ADL").
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
# Patch 2 (upstream: https://github.com/skoba/openehr-ruby/issues/51): an archetype slot with neither include nor exclude, e.g.
#   allow_archetype CLUSTER[at0008] occurrences matches {0..*} matches { }
# (CKM emits this for "any archetype" slots; CLUSTER.person.v1, OBSERVATION.body_temperature.v2).
if ! grep -q "empty archetype slot" "$G"; then
  # The rule opens with "      rule archetype_slot" and closes with "      end" (6 spaces);
  # the "end" of each inner "def value" is indented deeper, so match the exact indent.
  ruby -i -pe '
    if $_ =~ /^      rule archetype_slot\s*$/ .. $_ =~ /^      end\s*$/
      if $_ =~ /^      end\s*$/
        $_ = <<PATCH + $_
      / c_archetype_slot_head SYM_MATCHES SYM_START_CBLOCK SYM_END_CBLOCK space {   # empty archetype slot
          def value(node)
            OpenEHR::AM::Archetype::ConstraintModel::ArchetypeSlot.new(c_archetype_slot_head.value(node))
          end
        }
PATCH
      end
    end' "$G"
  echo "patched $G to accept empty archetype slots"
fi
# Patch 3 (upstream: https://github.com/skoba/openehr-ruby/issues/52): a translation whose author block is empty (author = < >) parses as nil and
# TranslationDetails then raises "author is mandatory" (e.g. the fi translation of
# EVALUATION.problem_diagnosis.v1). Treat it as an empty author hash.
H=vendor/openehr-ruby/lib/openehr/parser/adl_helper.rb
if grep -q ":author => details\['author'\],$" "$H"; then
  sed -i "s/:author => details\['author'\],$/:author => details['author'] || { },/" "$H"
  echo "patched $H to tolerate empty translation authors"
fi
echo "export ADL_I18N_LIBS=\"$(pwd)/vendor/openehr-ruby/lib\"" > .env
echo "export LANG=C.UTF-8 RUBYOPT=-Eutf-8" >> .env
echo "wrote .env - run: source .env"
