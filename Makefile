MAIN = thesis
BUILD_DIR = build

.PHONY: all clean distclean

## Build PDF with latexmk (handles biber + multiple pdflatex runs automatically)
all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex titlepage.tex chapters/*.tex appendix/*.tex references.bib
	@mkdir -p $(BUILD_DIR)/chapters $(BUILD_DIR)/appendix
	latexmk -pdf -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(MAIN)
	@cp $(BUILD_DIR)/$(MAIN).pdf .

## Remove auxiliary files but keep PDF
clean:
	latexmk -c -output-directory=$(BUILD_DIR) $(MAIN)

## Remove everything including PDF
distclean:
	latexmk -C -output-directory=$(BUILD_DIR) $(MAIN)
	@rm -f $(MAIN).pdf

## Manual build (fallback if latexmk is unavailable)
manual:
	mkdir -p $(BUILD_DIR)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(MAIN)
	biber $(BUILD_DIR)/$(MAIN)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(MAIN)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(MAIN)
	@cp $(BUILD_DIR)/$(MAIN).pdf .
