#
# ignore module: do not render certain targets
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

targets := $(filter-out $(addprefix $(DST)/,$(IGNORE)),$(targets))
