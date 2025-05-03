# PDF Resume Generator

A clean, simple resume generation system that converts a ConTeXt source file into a professional PDF resume.

## Getting Started

```bash
git clone https://github.com/m3di/ai-resume.git
cd ai-resume
```

## Usage Options

### Option 1: Local Build

Prerequisites:
* ConTeXt 0.6x

```bash
# Generate PDF
make

# Or use specific commands
make clean     # Clean output directory
make pdf       # Generate PDF
make clean-pdf # Clean and generate PDF
```

Output file will be in the `output` directory.

### Option 2: Docker Build (Recommended)

No local dependencies required:

```bash
# Generate PDF (default)
docker-compose up

# Or use specific commands
docker-compose run resume clean     # Clean output directory
docker-compose run resume pdf       # Generate PDF
docker-compose run resume clean-pdf # Clean and generate PDF
```

Output file will be in the `output` directory along with log files for debugging.

## Customization

To change the resume content and style:
1. Edit `styles/chmduquesne.tex` (content)
2. Edit `styles/chmduquesne.css` (additional styling if needed)
3. Rebuild using one of the commands above

## Installing Dependencies (for local build only)

### Debian / Ubuntu
```bash
sudo apt install context
```

### Fedora
```bash
sudo dnf install texlive-collection-context
```

### Arch
```bash
sudo pacman -S texlive-context
```

### macOS
```bash
brew install --cask mactex
export PATH=$PATH:/Library/TeX/texbin/
```

## Troubleshooting

If you encounter ConTeXt errors:
```bash
mtxrun --generate
```

For more details, see [ConTeXt troubleshooting](https://tex.stackexchange.com/questions/53892/texlive-2011-context-problem).

To debug PDF generation issues, check the log files in the `output` directory.
