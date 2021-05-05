#
# index module: process targets only after all others have been processed
#
# Copyright 2018 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# Allow the user to denotate a class of source documents that should be
# processed only after all others, with a .index extension. Useful for e.g. rss
# feeds or sitemap builders.
targets := $(filter-out %.index,$(targets)) $(addprefix I/,$(filter %.index,$(targets)))
targets := $(targets:.index=)
