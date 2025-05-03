# --------- Build settings ----------------------------------------------------
OUT_DIR      = output
STYLE_DIR    = styles
STYLE_BASE   = chmduquesne          # chmduquesne.tex  /  chmduquesne.css
TEX_SOURCE   = $(STYLE_DIR)/$(STYLE_BASE).tex
CSS_SOURCE   = $(STYLE_DIR)/$(STYLE_BASE).css

# --------- Phony targets -----------------------------------------------------
.PHONY: all pdf html docx rtf init dir clean

all: pdf html docx rtf           # default target  ->  make

# --------- PDF (ConTeXt) -----------------------------------------------------
pdf: init
	@echo "==> $(STYLE_BASE).pdf"
	@mtxrun --path=$(STYLE_DIR) \
	        --result=$(STYLE_BASE).pdf \
	        --script context $(TEX_SOURCE) \
	        > $(OUT_DIR)/context_$(STYLE_BASE).log 2>&1
	@mv $(STYLE_BASE).pdf $(OUT_DIR)/

# --------- HTML --------------------------------------------------------------
html: init
	@echo "==> $(STYLE_BASE).html"
	@pandoc --standalone \
	        --from latex --to html \
	        --include-in-header $(CSS_SOURCE) \
	        --lua-filter=pdc-links-target-blank.lua \
	        --metadata pagetitle="$(STYLE_BASE)" \
	        --output $(OUT_DIR)/$(STYLE_BASE).html \
	        $(TEX_SOURCE)

# --------- DOCX --------------------------------------------------------------
docx: init
	@echo "==> $(STYLE_BASE).docx"
	@pandoc --standalone \
	        --from latex --to docx \
	        --output $(OUT_DIR)/$(STYLE_BASE).docx \
	        $(TEX_SOURCE)

# --------- RTF ---------------------------------------------------------------
rtf: init
	@echo "==> $(STYLE_BASE).rtf"
	@pandoc --standalone \
	        --from latex --to rtf \
	        --output $(OUT_DIR)/$(STYLE_BASE).rtf \
	        $(TEX_SOURCE)

# --------- Helpers -----------------------------------------------------------
init: dir

dir:
	@mkdir -p $(OUT_DIR)

clean:
	@echo "Cleaning $(OUT_DIR)…"
	@rm -f $(OUT_DIR)/*
