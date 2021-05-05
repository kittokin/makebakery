#
# source module: copy targets from a directory on the filesystem
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

ifndef SRC
$(error SRC, the location for source files, is not defined)
endif

sources := $(shell find -L $(SRC) \! \( \( -regex '.*/\.\(gitignore\|site\|sass-cache\)' -o -regex '.*\.\(inc\|swp\|orig\|git\|draft\)' \) -prune \) -type f )
targets := $(sources:$(SRC)/%=$(DST)/%)
$(DST)/%: $(SRC)/%
	@test -d "$(dir $@)" || mkdir -p "$(dir $@)"
	cp -p $< $@
