#
# Process .sass scripts into .css
#
targets := $(targets:.sass=.css)
targets := $(targets:.scss=.css)

$(DST)/%.css: $(DST)/%.sass
	sassc $^ $@

$(DST)/%.css: $(DST)/%.scss
	sassc $^ $@
