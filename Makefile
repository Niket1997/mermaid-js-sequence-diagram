all: $(addsuffix .png, $(basename $(wildcard *.mmd)))

%.png: %.mmd style.css config.json
	mmdc -C style.css -w 2048 -H 1536 -c config.json -t forest -i $< -s 5 -o $@
	exiftool -Source"<=$<" $@
	open $@