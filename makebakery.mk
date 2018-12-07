.SUFFIXES:
.NOTPARALLEL: clean
.PHONY: default all clean gh-pages
default: all

ifeq (,$(findstring guile,$(.FEATURES)))
reverse = $(if $(wordlist 2,2,$(1)),$(call reverse,$(wordlist 2,$(words $(1)),$(1))) $(firstword $(1)),$(1))
else
reverse = $(guile (reverse (string-tokenize "$(1)")))
endif

# modules to include:
# 1. those in modules directory, either files or directory/module.mk, in order
# 2. those in sources directories
# 3. those in modules directory, in reverse order
MODULES				:= $(sort $(MODULES))
modules_path  := $(dir $(lastword $(MAKEFILE_LIST)))/modules
include $(wildcard $(addprefix $(modules_path)/,\
	$(addsuffix /module.mk,    $(MODULES)) \
	$(addsuffix .mk,           $(MODULES)) \
	$(addsuffix /module_out.mk,$(call reverse,$(MODULES)))))

targets := $(filter-out $(addprefix $(DST)/,$(IGNORE)),$(targets))

all: $(targets)

gh-pages:
	# Ensuring there are no uncommitted changes in the current branch:
	git status -s
	[ -z "$$(git status -s)" ]
	# Ensuring local gh-pages branch exists here:
	git show-ref refs/heads/gh-pages
	# Ensuring local gh-pages branch is not currently checked out here:
	[ "$$(git symbolic-ref HEAD)" != "refs/heads/gh-pages" ]
	# Ensuring $(DST) is a clone of this repo and gh-pages branch is checked out there:
	[ "$$(git -C $(DST) symbolic-ref HEAD)" = "refs/heads/gh-pages" ]
	$(MAKE) all
	git -C $(DST) add .
	git -C $(DST) commit -a -m "Result of 'make gh-pages' against commit $$(git rev-parse --short HEAD)"
	git -C $(DST) push

# By default, GNU Make will skip any source files that have
# not been modified since the last time they were rendered.
# Run 'make clean' to erase the destination directory for a
# complete rebuild. I do a 'mv' then 'rm' to reduce the
# chances of running an 'rm -rf /'.
adst := $(realpath $(DST))
clean:
	mv "$(adst)" "$(adst).old"
	mkdir "$(adst)"
	if [ -d "$(adst).old/.git" ]; then mv "$(adst).old/.git" "$(adst)"; fi
	rm -rf "$(adst).old"
