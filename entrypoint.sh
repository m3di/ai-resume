#!/bin/sh
set -e

# Create output directory if it doesn't exist
mkdir -p /app/output

# Function to clean the output directory
clean() {
  echo "Cleaning output directory..."
  rm -rf /app/output/*
  # Also clean any temporary files in templates directory
  rm -f /app/templates/*.log /app/templates/*.tuc /app/templates/*.pdf
  echo "Output directory cleaned."
}

# Function to generate PDF from LaTeX
generate_latex_pdf() {
  local input_file="$1"
  local output_name="$2"
  
  echo "Generating PDF using pdflatex..."
  
  # Check if input file exists
  if [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file not found"
    exit 1
  fi
  
  # Copy the tex file to output directory for processing
  cp "$input_file" "/app/output/${output_name}.tex"
  
  # Run pdflatex in the output directory to keep all temp files there
  cd /app/output
  pdflatex -interaction=nonstopmode "${output_name}.tex" > pdflatex.log 2>&1
  
  # Run pdflatex twice to resolve references
  pdflatex -interaction=nonstopmode "${output_name}.tex" >> pdflatex.log 2>&1
  
  # Check if PDF was generated successfully
  if [ -f "${output_name}.pdf" ]; then
    echo "PDF generated successfully: output/${output_name}.pdf"
    # Clean up temporary files
    rm -f "${output_name}.tex" "${output_name}.aux" "${output_name}.log" "${output_name}.out"
  else
    echo "Failed to generate PDF. Check pdflatex.log in output directory for details."
    exit 1
  fi
}

# Show usage
show_usage() {
  echo "Usage:"
  echo "  $0 clean                          - Clean output directory"
  echo "  $0 latex INPUT_FILE [OUTPUT_NAME] - Generate PDF from LaTeX file"
  echo "  $0 clean-latex INPUT_FILE [OUTPUT_NAME] - Clean and generate PDF"
  echo ""
  echo "Examples:"
  echo "  $0 latex /app/templates/resume.tex resume"
  echo "  $0 latex /app/templates/cv.tex cv"
}

# Main command processing
case "$1" in
  clean)
    clean
    ;;
  latex)
    if [ -z "$2" ]; then
      echo "Error: Input file not specified"
      show_usage
      exit 1
    fi
    output_name="${3:-${2##*/}}"
    output_name="${output_name%.*}"
    generate_latex_pdf "$2" "$output_name"
    ;;
  clean-latex)
    if [ -z "$2" ]; then
      echo "Error: Input file not specified"
      show_usage
      exit 1
    fi
    clean
    output_name="${3:-${2##*/}}"
    output_name="${output_name%.*}"
    generate_latex_pdf "$2" "$output_name"
    ;;
  *)
    show_usage
    exit 1
    ;;
esac 