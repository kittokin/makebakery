#
# Retrieve resources named in .url files
#
# Format of a .url file should be a single line containing a URL to hand to
# 'curl'
#
targets := $(targets:.url=)

$(DST)/%: $(DST)/%.url
	grep -v '^#|$$' $^ | head -1 | xargs curl -o $@ 
