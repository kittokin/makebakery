# Markdown to HTML, using 'theme', a tool included with the markdown tool 'discount'
targets := $(targets:.md=.html)
$(DST)/%.html: $(DST)/%.md $(MODS)/discount-theme/page.theme
	# Rendering $< to $@ with theme
	theme -t $(MODS)/discount-theme/page.theme -o $@ $<
