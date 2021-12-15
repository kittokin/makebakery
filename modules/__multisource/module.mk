#
# multisource module: merge together targets from multiple directories on the
# filesystem
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# define SRC to contain one or several directories from which to source files.
# temporary makefile snippets will be created and imported.

ifndef SRC
$(error SRC, the location(s) for source files, is not defined)
endif

multisourcedir := $(dir $(lastword $(MAKEFILE_LIST)))
sourcemks :=  $(addsuffix /source.mk,$(SRC))
#.INTERMEDIATE: $(sourcemks) # causes infinite loop
$(sourcemks): $(multisourcedir)/source.mk.template
	echo > $@
	echo >> $@ "srcdir := $(dir $@)"
	echo >> $@ ".INTERMEDIATE: $@"
	cat $(multisourcedir)/source.mk.template >> $@

include $(sourcemks)
