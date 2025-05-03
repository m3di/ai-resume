#!/bin/sh
set -e

# Create output directory if it doesn't exist
mkdir -p /app/output

# Function to clean the output directory
clean() {
  echo "Cleaning output directory..."
  rm -rf /app/output/*
  echo "Output directory cleaned."
}

# Function to generate PDF
generate_pdf() {
  echo "Generating PDF..."
  cd /app/styles
  
  # Run context and redirect logs to output directory
  context chmduquesne.tex > /app/output/context.log 2>&1 
  
  # Check if PDF was generated successfully
  if [ -f "chmduquesne.pdf" ]; then
    # Copy other log files to output directory for debugging
    cp chmduquesne.log /app/output/ 2>/dev/null || true
    cp chmduquesne.tuc /app/output/ 2>/dev/null || true
    
    # Move the generated PDF to output directory
    mv chmduquesne.pdf /app/output/
    echo "PDF generated successfully and saved to output directory."
  else
    echo "Failed to generate PDF. Check logs in output directory for details."
    exit 1
  fi
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