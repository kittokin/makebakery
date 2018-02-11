$(DST)/%/$(DEFAULT_DOCUMENT): $(DST)/%.html
	install -m 644 -D $< $@
