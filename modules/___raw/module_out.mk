# "raw" files will be saved as-is even if their next higher
# extension is .html.
targets := $(targets:.raw=)
$(DST)/%: $(DST)/%.raw
	cp -p $< $@
