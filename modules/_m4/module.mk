m4_templates := true
# Any files named '*.html.m4' will be interpreted by M4
# with the macros available, wrapped in the HTML template,
# and saved without the '.m4' extension.
$(DST)/%.html: $(DST)/%.html.m4 $(M4_CONFIG) $(M4_MACROS) $(M4_TEMPLATE)
	$(M4) $(M4_CONFIG) $(M4_MACROS) $< $(M4_TEMPLATE) > $@
# Any other files named '*.m4' will be interpreted by M4
# with the macros available, saved without the '.m4'
# extension, but will not be wrapped in the HTML template.
# This lets you use M4 within .css, .js, etc. (Just name
# them blah.css.m4, blah.js.m4, etc.)
$(DST)/%: $(DST)/%.m4 $(M4_CONFIG) $(M4_MACROS)
	$(M4) $(M4_CONFIG) $(M4_MACROS) $< > $@
