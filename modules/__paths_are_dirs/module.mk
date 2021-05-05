#
# paths_are_dirs module: convert foo.html to foo/index.html
#
# Copyright 2018 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

export DEFAULT_DOCUMENT ?= index.html

$(DST)/%/$(DEFAULT_DOCUMENT): $(DST)/%.html
	install -m 644 -D $< $@
