# Basic source module.
#
ifndef SRC
$(error SRC, the location for source files, is not defined)
endif

sources := $(shell find -L $(SRC) \! \( \( -regex '.*/\.\(gitignore\|site\|sass-cache\)' -o -regex '.*\.\(inc\|swp\|orig\|git\|draft\)' \) -prune \) -type f )
targets := $(sources:$(SRC)/%=$(DST)/%)
$(DST)/%: $(SRC)/%
	@test -d "$(dir $@)" || mkdir -p "$(dir $@)"
	cp -p $< $@
