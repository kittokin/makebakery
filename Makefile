SRC                 := demo-src
DST                 := build/makebakery
SITE              := $(SRC)/.site
MODS              := $(SITE)/modules
DEFAULT_DOCUMENT  := index.html

# BASEPATH is the absolute path to the root on the
# filesystem of the site build-out
BASEPATH          := $(shell readlink $(DST) || echo $(DST))

# BASEURL is the URL path from the root of the domain to
# the root of the site. If defined, should start with / and
# never end with /
BASEURL             := /makebakery
SITEHOST          := https://datagrok.github.io
SITENAME          := makebakery

PLATFORM          := $(shell uname -s)

export DST
export SRC
export BASEURL
export DEFAULT_DOCUMENT
export SITE
export MODS

.NOTPARALLEL: clean
.PHONY: defaut all clean gh-pages
default: all

# we could $(sort $(wildcard $(MODS))) here instead.
modules := $(sort $(wildcard $(MODS)/*))

ifeq (,$(findstring guile,$(.FEATURES)))
reverse = $(if $(wordlist 2,2,$(1)),$(call reverse,$(wordlist 2,$(words $(1)),$(1))) $(firstword $(1)),$(1))
else
reverse = $(guile (reverse (string-tokenize "$(1)")))
endif

# modules to include:
# 1. those in modules directory, either files or directory/module.mk, in order
# 2. those in sources directories
# 3. those in modules directory, in reverse order
include $(wildcard \
	$(addsuffix /module.mk,    $(modules)) \
	$(addsuffix .mk,           $(modules)) \
	$(addsuffix /module_out.mk,$(call reverse,$(modules))))

all: $(targets)

gh-pages:
	[ -z "$$(git status -s)" ] # Error on unpublished changes
	$(MAKE) clean
	$(MAKE) -rRj4
	[ "$$(git -C $(DST) symbolic-ref HEAD)" = "refs/heads/gh-pages" ] # Error with gh-pages clone
	git -C $(DST) add .
	git -C $(DST) commit -a -m "Result of 'make gh-pages' against commit $$(git rev-parse --short HEAD)"
	git -C $(DST) push

# By default, GNU Make will skip any source files that have
# not been modified since the last time they were rendered.
# Run 'make clean' to erase the destination directory for a
# complete rebuild. I do a 'mv' then 'rm' to reduce the
# chances of running an 'rm -rf /'.
clean:
	mv "$(BASEPATH)" "$(BASEPATH).old"
	mkdir "$(BASEPATH)"
	if [ -d "$(BASEPATH).old/.git" ]; then mv "$(BASEPATH).old/.git" "$(BASEPATH)"; fi
	rm -rf "$(BASEPATH).old"

vim: tw=59 :
