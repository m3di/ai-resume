# Pandoc Resume

A clean, simple resume generation system that converts a LaTeX source file into multiple output formats (PDF, HTML, DOCX, RTF).

## Getting Started

```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
```

## Usage Options

### Option 1: Local Build

Prerequisites:
* ConTeXt 0.6x
* Pandoc 2.x

```bash
# Generate all formats (PDF, HTML, DOCX, RTF)
make

# Or generate specific formats
make pdf
make html
make docx
make rtf
```

Output files will be in the `output` directory.

### Option 2: Docker Build

No local dependencies required:

```bash
docker-compose up -d
```

Output files will be in the `output` directory.

### Option 3: AI-Assisted Generation

For an AI-assisted approach:

1. Create your input files:
   * `markdown/me.txt` — Your personal/professional info
   * `markdown/jobposting.txt` — Target job description
   * `markdown/template.txt` — Resume layout preferences

2. Use the AI workflow described in `AI_INSTRUCTIONS.md` to generate your LaTeX files

3. Build using either local or Docker methods above

## Customization

To change style:
1. Edit `styles/chmduquesne.tex` (content)
2. Edit `styles/chmduquesne.css` (styling for HTML output)
3. Rebuild using `make`

## Installing Dependencies

### Debian / Ubuntu
```bash
sudo apt install pandoc context
```

### Fedora
```bash
sudo dnf install pandoc texlive-collection-context
```

### Arch
```bash
sudo pacman -S pandoc texlive
```

### macOS
```bash
brew install pandoc
brew install --cask mactex
export PATH=$PATH:/Library/TeX/texbin/
```

### Nix
```bash
nix build
```

## Troubleshooting

If you encounter ConTeXt errors:
```bash
mtxrun --generate
```

For more details, see [ConTeXt troubleshooting](https://tex.stackexchange.com/questions/53892/texlive-2011-context-problem).

Would you like this `README.md` turned into a PR or patch for your Git project?
