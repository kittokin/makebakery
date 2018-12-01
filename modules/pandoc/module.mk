# email obfuscation=none so that email addresses specified in author field
# don't get replaced by huge script tags.
default_pandoc_template := $(dir $(lastword $(MAKEFILE_LIST)))/template.html
PANDOC_TEMPLATE ?= $(default_pandoc_template)
ifdef m4_templates
targets := $(targets:.html.m4.md=.html.m4)
targets := $(targets:.md=.html.m4)
$(DST)/%.html.m4: $(DST)/%.md $(PANDOC_TEMPLATE)
	pandoc -f markdown+smart -t html5 --base-header-level 2 --email-obfuscation=none --template=$(PANDOC_TEMPLATE) -o $@ $<
$(DST)/%.html.m4: $(DST)/%.html.m4.md $(PANDOC_TEMPLATE)
	pandoc -f markdown+smart -t html5 --base-header-level 2 --email-obfuscation=none --template=$(PANDOC_TEMPLATE) -o $@ $<
else
targets := $(targets:.md=.html)
$(DST)/%.html: $(DST)/%.md $(PANDOC_TEMPLATE)
	pandoc -f markdown+smart -t html5 --base-header-level 2 --email-obfuscation=none --template=$(PANDOC_TEMPLATE) -o $@ $<
endif
