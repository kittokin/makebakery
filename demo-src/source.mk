
srcdir := demo-src/
# srcdir := .../
sources := $(shell find -L $(srcdir) \! \( \( -regex '.*/\.\(gitignore\|site\|sass-cache\)' -o -regex '.*\.\(inc\|swp\|orig\|git\)' -o -regex '.*/modules' \) -prune \) -type f )
targets := $(patsubst $(srcdir)%,$(DST)/%,$(sources)) $(targets)

$(DST)/%: $(srcdir)%
	@test -d "$(dir $@)" || mkdir -p "$(dir $@)"
	cp $< $@
