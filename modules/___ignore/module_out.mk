#
# ignore module: do not render certain targets
#
# Copyright 2021 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

targets := $(filter-out $(addprefix $(DST)/,$(IGNORE)),$(targets))
