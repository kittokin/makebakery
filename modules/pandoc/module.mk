# - email obfuscation=none so that email addresses specified in author field
# don't get replaced by huge script tags.
# - --template implies --standalone

PANDOC_ARGS = \
	-f markdown+pipe_tables+header_attributes+smart \
	-t html5 \
  --base-header-level=2 \
  --strip-comments \
	--email-obfuscation=none \
	  --standalone

ifdef PANDOC_TEMPLATE
PANDOC_ARGS += --template=$(PANDOC_TEMPLATE)
endif
ifdef PANDOC_HEADER
PANDOC_ARGS += --include-in-header=$(PANDOC_HEADER)
endif
ifdef PANDOC_BEFORE_BODY
PANDOC_ARGS += --include-before-body=$(PANDOC_BEFORE_BODY)
endif
ifdef PANDOC_AFTER_BODY
PANDOC_ARGS += --include-after-body=$(PANDOC_AFTER_BODY)
endif
ifdef PANDOC_STYLESHEET
PANDOC_ARGS += --css $(PANDOC_STYLESHEET)
endif

ifdef m4_templates

PANDOC_TEMPLATE ?= $(dir $(lastword $(MAKEFILE_LIST)))/m4_passthrough.template
targets := $(targets:.html.m4.md=.html.m4)
targets := $(targets:.md=.html.m4)

$(DST)/%.html.m4: $(DST)/%.md $(PANDOC_TEMPLATE) $(PANDOC_HEADER) $(PANDOC_BEFORE_BODY) $(PANDOC_AFTER_BODY)
	pandoc $(PANDOC_ARGS) $< > $@

$(DST)/%.html.m4: $(DST)/%.html.m4.md $(PANDOC_TEMPLATE) $(PANDOC_HEADER) $(PANDOC_BEFORE_BODY) $(PANDOC_AFTER_BODY)
	pandoc $(PANDOC_ARGS) $< > $@

else

targets := $(targets:.md=.html)

$(DST)/%.html: $(DST)/%.md $(PANDOC_TEMPLATE) $(PANDOC_HEADER) $(PANDOC_BEFORE_BODY) $(PANDOC_AFTER_BODY)
	pandoc $(PANDOC_ARGS) $< > $@

endif
