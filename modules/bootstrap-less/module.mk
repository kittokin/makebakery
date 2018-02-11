# I suppose I could use grunt here instead?

bootstrap_deps := $(addprefix $(SRC)/_/less/,$(addsuffix .less, variables mixins normalize print scaffolding type code grid tables forms buttons component-animations glyphicons dropdowns button-groups input-groups navs navbar breadcrumbs pagination pager labels badges jumbotron thumbnails alerts progress-bars media list-group panels wells close modals tooltip popovers carousel utilities responsive-utilities))

theme_deps := $(addprefix $(SRC)/_/less/,$(addsuffix .less, variables mixins))

targets := $(filter-out %.less,$(targets))
# targets := $(DST)/_/css/bootstrap.min.css $(DST)/_/css/bootstrap-theme.min.css

# Use lessc to compile .less files into their output minified css.
# I would use twitter "recess" but it doesn't work on my box so meh
$(DST)/_/css/bootstrap-theme.min.css: $(SRC)/_/less/theme.less $(theme_deps)
	# Rendering $< to $@ with less
	lessc --include-path=$(SRC)/_/less "$<" > "$@"
$(DST)/_/css/bootstrap.min.css: $(SRC)/_/less/bootstrap.less $(bootstrap_deps)
	# Rendering $< to $@ with less
	lessc --include-path=$(SRC)/_/less "$<" > "$@"
