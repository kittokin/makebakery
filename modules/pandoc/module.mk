#
# pandoc module: use pandoc to convert markdown to html
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# - email obfuscation=none so that email addresses specified in author field
# don't get replaced by huge script tags.
# - --template implies --standalone

PANDOC_VERSION ?= 2
PANDOC_ARGS = \
    -t html5 \
    --shift-heading-level-by=1 \
    --email-obfuscation=none \
    --standalone

ifeq ($(PANDOC_VERSION),2)
PANDOC_ARGS += -f markdown+pipe_tables+header_attributes+auto_identifiers+smart --strip-comments
else
PANDOC_ARGS += -f markdown+pipe_tables+header_attributes+auto_identifiers --smart
endif
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
PANDOC_ARGS += $(foreach css,$(PANDOC_STYLESHEET),--css $(css))
endif
ifdef PANDOC_SIDENOTE
PANDOC_ARGS += --filter pandoc-sidenote
endif

ifdef m4_templates

PANDOC_TEMPLATE ?= $(dir $(lastword $(MAKEFILE_LIST)))/m4_passthrough.template
targets := $(targets:.html.m4.md=.html.m4)
targets := $(targets:.md=.html.m4)

$(DST)/%.html.m4: $(DST)/%.md $(PANDOC_TEMPLATE) $(PANDOC_HEADER) $(PANDOC_BEFORE_BODY) $(PANDOC_AFTER_BODY)
	@echo "$(subst $(DST),,$@)" ← "$(notdir $<)"
	pandoc $(PANDOC_ARGS) --metadata=mtime_msec:"$(shell stat -c %Y $<)000" $< > $@

$(DST)/%.html.m4: $(DST)/%.html.m4.md $(PANDOC_TEMPLATE) $(PANDOC_HEADER) $(PANDOC_BEFORE_BODY) $(PANDOC_AFTER_BODY)
	@echo "$(subst $(DST),,$@)" ← "$(notdir $<)"
	pandoc $(PANDOC_ARGS) --metadata=mtime_msec:"$(shell stat -c %Y $<)000" $< > $@

else

targets := $(targets:.md=.html)

$(DST)/%.html: $(DST)/%.md $(PANDOC_TEMPLATE) $(PANDOC_HEADER) $(PANDOC_BEFORE_BODY) $(PANDOC_AFTER_BODY)
	@echo "$(subst $(DST),,$@)" ← "$(notdir $<)"
	pandoc $(PANDOC_ARGS) $< > $@

endif
