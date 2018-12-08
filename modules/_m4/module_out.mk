#
# m4 module: process targets with GNU m4
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

#
# Filter files with .m4 extensions through the m4 macro processor.
#
m4modpath		:= $(dir $(lastword $(MAKEFILE_LIST)))
M4					:= m4 \
    -I etc \
    -P \
    -D__BASEURL="$(BASEURL)" \
    -D__SITEHOST="$(SITEHOST)" \
    -D__SITENAME="$(SITENAME)" \
    -D__M4LIB="$(m4modpath)"
M4_CONFIG		?= $(m4modpath)config.m4
M4_MACROS		?= $(m4modpath)macros.m4
M4_TEMPLATE ?= $(m4modpath)m4-template.html.m4
targets			:= $(targets:.m4=)
