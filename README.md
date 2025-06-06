# PDF Resume Generator

A flexible LaTeX-based resume generation system that converts LaTeX source files into professional PDF resumes.

## Getting Started

```bash
git clone https://github.com/m3di/ai-resume.git
cd ai-resume
```

## Usage

### Using Docker (Recommended)

No local dependencies required. Place your LaTeX files in the `templates` directory and use:

```bash
# Basic usage
docker-compose run resume latex /app/templates/your-resume.tex [output-name]

# Examples:
docker-compose run resume latex /app/templates/resume.tex my-resume  # Generates my-resume.pdf
docker-compose run resume latex /app/templates/cv.tex               # Generates cv.pdf
docker-compose run resume clean                                     # Clean output directory
docker-compose run resume clean-latex /app/templates/resume.tex     # Clean and regenerate PDF
```

Output files will be in the `output` directory.

### Using Local pdfLaTeX

If you prefer to build locally, ensure you have pdfLaTeX installed:

#### Installing pdfLaTeX

##### Debian / Ubuntu
```bash
sudo apt install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
```

##### Fedora
```bash
sudo dnf install texlive-scheme-basic texlive-latex texlive-collection-latexextra
```

##### Arch
```bash
sudo pacman -S texlive-core texlive-latexextra
```

##### macOS
```bash
brew install --cask mactex
export PATH=$PATH:/Library/TeX/texbin/
```

Then build manually:

```bash
cd output
pdflatex ../templates/your-resume.tex
```

## Directory Structure

- `templates/` - Place your LaTeX source files here
- `output/` - Generated PDFs and build artifacts
- `archive/` - Store different versions of your resumes

## Troubleshooting

If you encounter build errors:

1. Check the logs in `output/pdflatex.log`
2. Verify your LaTeX syntax
3. Ensure all required LaTeX packages are available
4. Try cleaning and rebuilding:
   ```bash
   docker-compose run resume clean-latex /app/templates/your-resume.tex
   ```

For more detailed debugging:
```bash
# Start an interactive shell in the container
docker-compose run --entrypoint /bin/bash resume -c "cd /app && /bin/bash"

# Run pdflatex manually
cd output
pdflatex -interaction=nonstopmode ../templates/your-resume.tex
```

## Docker Container Management

```bash
# Build or rebuild the container
docker-compose build

# Stop and remove containers
docker-compose down

# View container logs
docker-compose logs
```

## License

See the [LICENSE](LICENSE) file for details.

## Acknowledgments

This project is based on [pandoc_resume](https://github.com/mszep/pandoc_resume) by mszep but has been fundamentally modified to meet different requirements.
