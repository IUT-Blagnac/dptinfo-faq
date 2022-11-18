#-----------------------------------------------------
MAIN=main
ICONSDIR=images/icons
IMAGESDIR=images
ASCIIDOCTOR=asciidoctor -a icons=font -a imagesdir=$(IMAGESDIR) -a data-uri -a toc2
EXT=asc
OUTPUT=.
DEP=definitions.txt asciidoc.conf *.asc
#-----------------------------------------------------

all: $(OUTPUT)/main.html

$(OUTPUT)/%.html: %.$(EXT) $(DEP)
	@echo '==> Compiling asciidoc files to generate HTML'
	$(ASCIIDOCTOR) -b html5 -a numbered -a eleve -o $@ $<
	cp main.html index.html

deploy:
	cp main.html index.html
	git commit -am "deploy updates"
	git push

