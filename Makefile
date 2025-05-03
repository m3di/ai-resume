# Simple Makefile for PDF resume generation
OUT_DIR = output
STYLE_DIR = styles
STYLE_BASE = chmduquesne
TEX_SOURCE = $(STYLE_DIR)/$(STYLE_BASE).tex

# Phony targets
.PHONY: all pdf clean clean-pdf

# Default target generates PDF
all: pdf

# Create output directory
$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

# Generate PDF
pdf: $(OUT_DIR)
	@echo "Generating PDF..."
	@cd $(STYLE_DIR) && context $(STYLE_BASE).tex > ../$(OUT_DIR)/context.log 2>&1
	@if [ -f "$(STYLE_DIR)/$(STYLE_BASE).pdf" ]; then \
		cp $(STYLE_DIR)/$(STYLE_BASE).log $(OUT_DIR)/ 2>/dev/null || true; \
		cp $(STYLE_DIR)/$(STYLE_BASE).tuc $(OUT_DIR)/ 2>/dev/null || true; \
		mv $(STYLE_DIR)/$(STYLE_BASE).pdf $(OUT_DIR)/; \
		echo "PDF generated successfully: $(OUT_DIR)/$(STYLE_BASE).pdf"; \
	else \
		echo "PDF generation failed. Check logs in $(OUT_DIR)"; \
		exit 1; \
	fi

# Clean output directory
clean:
	@echo "Cleaning output directory..."
	@rm -rf $(OUT_DIR)/*
	@echo "Output directory cleaned."

# Clean and then generate PDF
clean-pdf: clean pdf
