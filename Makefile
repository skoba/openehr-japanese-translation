# make new ADL=path/to/openEHR-EHR-XXX.yyy.v1.adl   -> archetypes/<id>/source/<id>.adl, work/<id>.tsv, work/fill.rb skeleton; state in_progress
# make build ID=openEHR-EHR-XXX.yyy.v1                -> work/fill.rb -> work/<id>.ja.tsv -> inject -> upload/<id>.adl (+ check); state review
# make import ID=openEHR-EHR-XXX.yyy.v1               -> work/<id>.ja.tsv (proofread in place) -> work/fill.rb, then build
# make check                                          -> check every archetypes/*/upload/*.adl
# make status                                         -> list status.tsv (alias: make list)
# make set-status ID=... STATE=uploaded|accepted [CKM_URL=...]   -> humans only (see CLAUDE.md); FORCE=1 allows going backwards
#
# upload/<id>.adl keeps the original file name on purpose: CKM only recognises a
# translation upload when its file name matches the archetype it belongs to.
AUTHOR ?= Shinji KOBAYASHI
ORG    ?= NPO openEHR Japan
EMAIL  ?= skoba@moss.gr.jp
RUBY   := ruby
TOOL   := $(RUBY) tools/adl_i18n.rb
STATUS := $(RUBY) tools/status.rb

.PHONY: new build import check status list set-status

new:
	@test -n "$(ADL)" || (echo "usage: make new ADL=file.adl"; exit 2)
	@id=$$(basename $(ADL) .adl); d=archetypes/$$id; mkdir -p $$d/source $$d/work; \
	 cp $(ADL) $$d/source/$$id.adl; \
	 $(TOOL) extract $$d/source/$$id.adl > $$d/work/$$id.tsv; \
	 test -f $$d/work/fill.rb || $(RUBY) tools/scaffold_fill.rb $$d/work/$$id.tsv > $$d/work/fill.rb; \
	 $(STATUS) set $$id in_progress; \
	 echo "created $$d (edit $$d/work/fill.rb, then: make build ID=$$id)"

build:
	@test -n "$(ID)" || (echo "usage: make build ID=openEHR-EHR-..."; exit 2)
	@d=archetypes/$(ID); mkdir -p $$d/upload; \
	 $(RUBY) $$d/work/fill.rb $$d/work/$(ID).tsv $$d/work/$(ID).ja.tsv && \
	 $(TOOL) inject $$d/source/$(ID).adl $$d/work/$(ID).ja.tsv --target ja \
	   --author "$(AUTHOR)" --organisation "$(ORG)" --email "$(EMAIL)" -o $$d/upload/$(ID).adl && \
	 $(STATUS) set $(ID) review

# Human proofreading: edit the target / note columns of work/<id>.ja.tsv directly,
# then `make import` regenerates work/fill.rb from it and rebuilds, so the TSV
# round-trips and `git diff work/<id>.ja.tsv` shows exactly the edits.
import:
	@test -n "$(ID)" || (echo "usage: make import ID=openEHR-EHR-..."; exit 2)
	@d=archetypes/$(ID); t=$$d/work/$(ID).ja.tsv; \
	 test -f $$t || (echo "$$t not found (run make build first)"; exit 2); \
	 $(RUBY) tools/scaffold_fill.rb $$t > $$d/work/fill.rb.tmp && mv $$d/work/fill.rb.tmp $$d/work/fill.rb && \
	 echo "imported $$t -> $$d/work/fill.rb" && $(MAKE) --no-print-directory build ID=$(ID)

check:
	@rc=0; for f in archetypes/*/upload/*.adl; do $(TOOL) check $$f || rc=1; done; exit $$rc

status list:
	@$(STATUS) list

set-status:
	@test -n "$(ID)" && test -n "$(STATE)" || (echo "usage: make set-status ID=openEHR-EHR-... STATE=uploaded|accepted [CKM_URL=https://...] [FORCE=1]"; exit 2)
	@$(STATUS) set $(ID) $(STATE) $(CKM_URL)
