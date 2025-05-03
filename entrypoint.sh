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

# Function to generate PDF
generate_pdf() {
  echo "Generating PDF..."
  
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

# Main command processing
case "$1" in
  clean)
    clean
    ;;
  pdf)
    generate_pdf
    ;;
  clean-pdf)
    clean
    generate_pdf
    ;;
  *)
    echo "Unknown command: $1"
    echo "Available commands: clean, pdf, clean-pdf"
    exit 1
    ;;
esac 