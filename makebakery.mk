.SUFFIXES:
.NOTPARALLEL: clean
.PHONY: default all clean gh-pages
default: all

ifndef SRC
$(error SRC is not defined)
endif

ifndef DST
$(error DST is not defined)
endif

ifndef MODULES
$(warning MODULES is not defined; makebakery will not do much without it...)
endif

# Define a mechanism to reverse a list. Used by the modules logic. This is
# surprisingly hard to do with GNU Make.
ifeq (,$(findstring guile,$(.FEATURES)))
reverse = $(if $(wordlist 2,2,$(1)),$(call reverse,$(wordlist 2,$(words $(1)),$(1))) $(firstword $(1)),$(1))
else
reverse = $(guile (reverse (string-tokenize "$(1)")))
endif

# Modules to include:
#
# 1. those in modules directory named <name>/module.mk
# 2. those in modules directory named <name>.mk
# 2. those in modules directory named <name>/module_out.mk, in reverse order
#
# This sets up a "ring" configuration, somewhat like django's middleware. This
# is necessary to allow all manipulation of the targets variable to occur before
# any rules are defined which might depend on it.
#
# Modules with high alphanumeric precedence (prefixed with underscores) get
# their module.mk processed before everything else, and their module_out.mk
# processed after everything else.
#
# Note: any names that do not match a module are silently ignored.
#
# The set of modules should define a variable named 'targets', and rules which
# transform source files to destination files within DST.
MODULES				:= $(sort $(MODULES))
modules_path  := $(dir $(lastword $(MAKEFILE_LIST)))/modules
include $(wildcard $(addprefix $(modules_path)/,\
	$(addsuffix /module.mk,    $(MODULES)) \
	$(addsuffix .mk,           $(MODULES)) \
	$(addsuffix /module_out.mk,$(call reverse,$(MODULES)))))

targets := $(filter-out $(addprefix $(DST)/,$(IGNORE)),$(targets))

all: $(targets)

gh-pages: all
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

# By default, GNU Make will skip any source files that have not been modified
# since the last time they were rendered. Run 'make clean' to erase the
# destination directory for a complete rebuild. I do a 'mv' then 'rm' to reduce
# the chances of running an 'rm -rf /'. The temporary directory and manipulation
# of the .git directory is to be compatible with destination directories that
# are git repos (such as when rendering for GitHub Pages).
adst := $(realpath $(DST))
clean:
	mv "$(adst)" "$(adst).old"
	mkdir "$(adst)"
	if [ -d "$(adst).old/.git" ]; then mv "$(adst).old/.git" "$(adst)"; fi
	rm -rf "$(adst).old"
