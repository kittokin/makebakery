#
# executable module: transform some targets by executing them and capturing their output
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

#
# Execute files named *.run; their output becomes the content of the rendered file.
#
# This allows for the creation of language-agnostic scripts to be executed at
# baking time (not request time). Scripts need not be marked executable (the
# various copy steps do not preserve mode.) They receive no arguments.
#
targets := $(targets:.run=)
$(DST)/%: $(DST)/%.run
	chmod +x $<
	cd $(DST); $< > $@
	chmod -x $<
