#
# raw module: prevent some files from being processed
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# "raw" files will be saved as-is even if their next higher
# extension is .html.
targets := $(targets:.raw=)
$(DST)/%: $(DST)/%.raw
	cp -p $< $@
