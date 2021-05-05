$(info   makebakery <https://datagrok.github.io/makebakery/>            )
$(info   Copyright 2018 Michael F. Lamb <https://datagrok.org>           )
$(info   License: AGPLv3+ with additional permissions; see COPYING      )
$(info                                                                  )

.SILENT:
.SUFFIXES:
.NOTPARALLEL: clean
.PHONY: default all clean
default: all

ifndef DST
$(error DST, the target directory for rendering, is not defined)
endif

ifndef SRC
$(warning SRC is not defined; defaulting to the current directory.)
SRC := .
endif

ifndef MODULES
$(warning MODULES is not defined; makebakery will not do much without it...)
endif

# Define a mechanism to reverse a list. Used by the modules logic. This is
# surprisingly hard to do with GNU Make. If this is make-guile it's a bit better
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
modules_path  := $(dir $(lastword $(MAKEFILE_LIST)))modules
include $(wildcard $(addprefix $(modules_path)/,\
	$(addsuffix /module.mk,    $(MODULES)) \
	$(addsuffix .mk,           $(MODULES)) \
	$(addsuffix /module_out.mk,$(call reverse,$(MODULES)))))

ifndef targets
$(warning targets is not defined; did you set MODULES?)
endif

all: $(targets)

# By default, GNU Make will skip any source files that have not been modified
# since the last time they were rendered. Run 'make clean' to erase the
# destination directory for a complete rebuild. I do a 'mv' then 'rm' to reduce
# the chances of running an 'rm -rf /'. The temporary directory and manipulation
# of the .git directory is to be compatible with destination directories that
# are git repos (such as when rendering for GitHub Pages).
clean: $(abspath $(DST))
	mv "$<" "$<.old"
	mkdir "$<"
	if [ -d "$<.old/.git" ]; then mv "$<.old/.git" "$<"; fi
	rm -rf "$<.old"
