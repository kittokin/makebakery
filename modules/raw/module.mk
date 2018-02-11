# "raw" files will be saved as-is even if their next higher
# extension is .html. This must come after any plugins that
# remove .html extensions.
targets := $(targets:.raw=)
$(DST)/%: $(DST)/%.raw
	cp $< $@
