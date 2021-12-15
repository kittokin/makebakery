#
# index module: process targets only after all others have been processed
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

indices := $(filter I/%,$(targets))
indices := $(indices:I/%=%)
nonindices := $(filter-out I/%,$(targets))
targets := $(nonindices) $(indices)
$(indices): $(nonindices)

# Any files named '*.index' will depend on the rest of the
# pages having been processed before being processed
# themselves. In this way you can create automatic indices,
# sitemaps, etc. No processing occurs here, we just remove
# the extension.
$(DST)/%: $(DST)/%.index
	cp -p $< $@
