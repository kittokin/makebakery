# email obfuscation=none so that email addresses specified in author field
# don't get replaced by huge script tags.
ifdef m4_templates
PANDOC_TEMPLATE := $(MODS)/pandoc/template.html
targets := $(targets:.html.m4.md=.html.m4)
targets := $(targets:.md=.html.m4)
$(DST)/%.html.m4: $(DST)/%.md $(PANDOC_TEMPLATE)
	# Rendering $< to $@ with pandoc
	pandoc -S -f markdown -t html5 --base-header-level 2 --email-obfuscation=none --template=$(PANDOC_TEMPLATE) -o $@ $<
$(DST)/%.html.m4: $(DST)/%.html.m4.md $(PANDOC_TEMPLATE)
	# Rendering $< to $@ with pandoc
	pandoc -S -f markdown -t html5 --base-header-level 2 --email-obfuscation=none --template=$(PANDOC_TEMPLATE) -o $@ $<
else
targets := $(targets:.md=)
$(DST)/%.html: $(DST)/%.md $(PANDOC_TEMPLATE)
	# Rendering $< to $@ with pandoc
	pandoc -S -f markdown -t html5 --base-header-level 2 --email-obfuscation=none --template=$(PANDOC_TEMPLATE) -o $@ $<
endif
