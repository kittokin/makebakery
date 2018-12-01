# Markdown to HTML, using 'theme', a tool included with the markdown tool 'discount'
targets := $(targets:.md=.html)
default_discount_theme := $(dir $(lastword $(MAKEFILE_LIST)))/page.theme
DISCOUNT_THEME ?= $(default_discount_theme)

$(DST)/%.html: $(DST)/%.md $(DISCOUNT_THEME)
	theme -t $(DISCOUNT_THEME) -o $@ $<
