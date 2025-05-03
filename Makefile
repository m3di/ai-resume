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
	@cp $(STYLE_DIR)/$(STYLE_BASE).tex $(OUT_DIR)/
	@cd $(OUT_DIR) && context $(STYLE_BASE).tex > context.log 2>&1
	@if [ -f "$(OUT_DIR)/$(STYLE_BASE).pdf" ]; then \
		rm -f $(OUT_DIR)/$(STYLE_BASE).tex; \
		echo "PDF generated successfully: $(OUT_DIR)/$(STYLE_BASE).pdf"; \
	else \
		echo "PDF generation failed. Check logs in $(OUT_DIR)"; \
		exit 1; \
	fi

# Clean output directory
clean:
	@echo "Cleaning output directory..."
	@rm -rf $(OUT_DIR)/*
	@rm -f $(STYLE_DIR)/*.log $(STYLE_DIR)/*.tuc $(STYLE_DIR)/*.pdf
	@echo "Output directory cleaned."

# Clean and then generate PDF
clean-pdf: clean pdf
