#!/bin/sh
set -e

# Create output directory if it doesn't exist
mkdir -p /app/output

# Function to clean the output directory
clean() {
  echo "Cleaning output directory..."
  rm -rf /app/output/*
  # Also clean any temporary files in styles directory
  rm -f /app/styles/*.log /app/styles/*.tuc /app/styles/*.pdf
  echo "Output directory cleaned."
}

# Function to generate PDF from ConTeXt (original functionality)
generate_context_pdf() {
  echo "Generating PDF using ConTeXt..."
  
  # Copy the tex file to output directory for processing
  cp /app/styles/chmduquesne.tex /app/output/
  
  # Run context in the output directory to keep all temp files there
  cd /app/output
  context chmduquesne.tex > context.log 2>&1 
  
  # Check if PDF was generated successfully
  if [ -f "chmduquesne.pdf" ]; then
    echo "PDF generated successfully and saved to output directory."
  else
    echo "Failed to generate PDF. Check logs in output directory for details."
    exit 1
  fi
  
  # Clean up the copied tex file
  rm -f /app/output/chmduquesne.tex
}

# Function to generate PDF from LaTeX
generate_latex_pdf() {
  echo "Generating PDF using pdflatex..."
  
  # Check if latex.tex exists
  if [ ! -f "/app/styles/latex.tex" ]; then
    echo "Error: latex.tex not found in /app/styles/"
    exit 1
  fi
  
  # Copy the tex file to output directory for processing
  cp /app/styles/latex.tex /app/output/
  
  # Run pdflatex in the output directory to keep all temp files there
  cd /app/output
  pdflatex -interaction=nonstopmode latex.tex > pdflatex.log 2>&1
  
  # Run pdflatex twice to resolve references
  pdflatex -interaction=nonstopmode latex.tex >> pdflatex.log 2>&1
  
  # Check if PDF was generated successfully
  if [ -f "latex.pdf" ]; then
    echo "PDF generated successfully: output/latex.pdf"
    # Clean up temporary files
    rm -f latex.tex latex.aux latex.log latex.out
  else
    echo "Failed to generate PDF. Check pdflatex.log in output directory for details."
    exit 1
  fi
}

# Main command processing
case "$1" in
  clean)
    clean
    ;;
  pdf)
    generate_context_pdf
    ;;
  latex)
    generate_latex_pdf
    ;;
  clean-pdf)
    clean
    generate_context_pdf
    ;;
  clean-latex)
    clean
    generate_latex_pdf
    ;;
  *)
    echo "Unknown command: $1"
    echo "Available commands: clean, pdf, latex, clean-pdf, clean-latex"
    exit 1
    ;;
esac 