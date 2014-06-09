# NOTE: If you add this module, add its counterpart 20_indexpass.mk as well.
indices := $(filter I/%,$(targets))
indices := $(indices:I/%=%)
nonindices := $(filter-out I/%,$(targets))
targets := $(nonindices) $(indices)
$(indices): $(nonindices)

# Any files named '*.index' will depend on the rest of the
# pages having been processed before being processed
# themselves. In this way you can create automatic indices,
# sitemaps, etc. No processing occurs here, we just remove
# the extension.
$(DST)/%: $(DST)/%.index
	cp $< $@
