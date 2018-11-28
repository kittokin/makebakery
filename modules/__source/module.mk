# Basic source module. 
#
sources := $(shell find -L $(SRC) \! \( \( -regex '.*/\.\(gitignore\|site\|sass-cache\)' -o -regex '.*\.\(inc\|swp\|orig\|git\)' \) -prune \) -type f )
targets := $(sources:$(SRC)/%=$(DST)/%)
$(DST)/%: $(SRC)/%
	@test -d "$(dir $@)" || mkdir -p "$(dir $@)"
	cp -p $< $@
