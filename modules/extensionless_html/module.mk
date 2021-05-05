#
# extensionless_html module: remove extension from html file targets for nice URLs
#
# Copyright 2018 Michael F. Lamb <https://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ https://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#

# DEPRECATED
#
# This module is deprecated. paths_are_dirs works better and easier and I don't
# feel like supporting this one.

# causes all .html files to be saved with no extension. For this to work right
# you should configure your webserver to set the Content-type header for these
# files to text/html. You might do this by setting the default mime-type to
# text/html, or by building a module that constructs an appropriate .htaccess
# file, etc.
#
# This helps to keep HTML URIs free of filename extensions. (URIs never need
# filename extensions, if your webserver can figure out a resource's file type
# through other means.) Apache "multiviews" or the "paths_are_dirs.mk" plugins
# are other ways to do the same.
#
# If you have multiple levels of source files, then /page will conflict with
# /page/child; /page can't be both a file and a directory at once. possible solutions:
# - You could modify this module to cause files to have some kind of prefix, or
# - You could modify this module to cause directories to have some kind of suffix, or
# - You could use paths_are_dirs

targets := $(targets:.html=)
$(DST)/%: $(DST)/%.html
	cp -p $< $@
