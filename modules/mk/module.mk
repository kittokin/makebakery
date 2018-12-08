#
# mk module: import targets that are makefile snippets
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

include $(filter %.mk,$(targets))
targets := $(filter-out %.mk,$(targets))

# We can't remove .mk files from the destination because make restarts itself
# after updating them, causing an infinite loop. Have to just exclude them from
# the upload, or provide a post-render step.
# .INTERMEDIATE: $(mks)
