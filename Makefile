all: $(addsuffix .png, $(basename $(wildcard *.mmd)))

%.png: %.mmd style.css config.json
	@mmdc -C style.css -c config.json -i $< -s 5 -o $@
	@exiftool -Source"<=$<" $@
	@convert -fuzz 5% -trim -border 100 -bordercolor white +repage $@ $@
	@open $@
