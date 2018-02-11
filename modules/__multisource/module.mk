# Multi-source module
#
# define SRC to contain one or several directories from which to source files.
# temporary makefile snippets will be created and imported.
#
sourcemks :=  $(addsuffix /source.mk,$(SRC))
#.INTERMEDIATE: $(sourcemks) # causes infinite loop
$(sourcemks): modules/__multisource/source.mk.template
	echo > $@
	echo >> $@ "srcdir := $(dir $@)"
	cat modules/__multisource/source.mk.template >> $@

include $(sourcemks)
