export DEFAULT_DOCUMENT ?= index.html

$(DST)/%/$(DEFAULT_DOCUMENT): $(DST)/%.html
	install -m 644 -D $< $@
