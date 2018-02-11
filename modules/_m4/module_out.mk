#
# Filter files with .m4 extensions through the m4 macro processor.
#
M4 	      := m4 -I etc -P -D__BASEURL="$(BASEURL)" -D__SITEHOST="$(SITEHOST)" -D__SITENAME="$(SITENAME)"
M4_CONFIG := $(MODS)/_m4/config.m4
M4_MACROS := $(MODS)/_m4/macros.m4
M4_TEMPLATE := $(SITE)/m4-template.html.m4
targets   := $(targets:.m4=)
