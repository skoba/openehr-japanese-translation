# make new ADL=path/to/openEHR-EHR-XXX.yyy.v1.adl   -> archetypes/<id>/ with TSV and fill.rb skeleton
# make build ID=openEHR-EHR-XXX.yyy.v1                -> fill TSV, inject ja, check
# make check                                          -> check every *.ja.adl
AUTHOR ?= Shinji Kobayashi
ORG    ?= Gifu University
EMAIL  ?= shnj.kobayashi@gmail.com
RUBY   := ruby
TOOL   := $(RUBY) tools/adl_i18n.rb

.PHONY: new build check list

new:
	@test -n "$(ADL)" || (echo "usage: make new ADL=file.adl"; exit 2)
	@id=$$(basename $(ADL) .adl); d=archetypes/$$id; mkdir -p $$d; \
	 cp $(ADL) $$d/$$id.adl; \
	 $(TOOL) extract $$d/$$id.adl > $$d/$$id.tsv; \
	 test -f $$d/fill.rb || $(RUBY) tools/scaffold_fill.rb $$d/$$id.tsv > $$d/fill.rb; \
	 echo "created $$d (edit $$d/fill.rb, then: make build ID=$$id)"

build:
	@test -n "$(ID)" || (echo "usage: make build ID=openEHR-EHR-..."; exit 2)
	@d=archetypes/$(ID); \
	 $(RUBY) $$d/fill.rb $$d/$(ID).tsv $$d/$(ID).ja.tsv && \
	 $(TOOL) inject $$d/$(ID).adl $$d/$(ID).ja.tsv --target ja \
	   --author "$(AUTHOR)" --organisation "$(ORG)" --email "$(EMAIL)" -o $$d/$(ID).ja.adl

check:
	@rc=0; for f in archetypes/*/*.ja.adl; do $(TOOL) check $$f || rc=1; done; exit $$rc

list:
	@for d in archetypes/*/; do id=$$(basename $$d); \
	  if [ -f $$d/$$id.ja.adl ]; then s=done; elif [ -f $$d/fill.rb ]; then s=in-progress; else s=todo; fi; \
	  printf "%-60s %s\n" $$id $$s; done
