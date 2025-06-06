# AI-Assisted Resume Generation

This guide helps you use AI to create a professionally formatted resume based on your information and a job posting.

## Workflow Overview

1. Prepare your input files
2. Generate markdown resume content
3. Generate LaTeX file from markdown
4. Build your resume in pdf format
5. Review and refine

## Step 1: Prepare Input Files

Create these markdown files in the `input/` directory:

* `goals.txt` - Your career objectives and target path
  ```markdown
  # Career Goals
  - Target Location
  - Career Path Progression
  - Key Success Factors
  - Professional Development Goals
  - Success Metrics
  ```

* `about-me.txt` - Your professional background and information
  ```markdown
  # Personal Information
  Name: [Your Name]
  Email: [your.email@example.com]
  
  # Skills
  - Skill 1
  - Skill 2
  
  # Experience
  ## [Company Name] (YYYY-MM - Present)
  - Accomplishment 1
  - Accomplishment 2
  
  # Education
  ## [University Name] (YYYY-YYYY)
  - Degree in [Field]
  ```

* `jobposting.txt` - Target job description
  ```markdown
  # [Job Title]
  
  ## Company
  [Company Name]
  
  ## Requirements
  - Requirement 1
  - Requirement 2
  
  ## Responsibilities
  - Responsibility 1
  - Responsibility 2
  ```

* `template.txt` - Format preferences
  ```markdown
  # Format Preferences
  
  Style: [Minimal/Classic/Modern]
  Colors: [Monochrome/Blue/Custom]
  Font: [Default/Sans-serif/Serif]
  
  # Section Order
  1. Contact Information
  2. Summary
  3. Skills
  4. Experience
  5. Education
  ```

* `knowledge.txt` - This file contains best practices and tips for crafting a strong resume. Please read it carefully before generating your resume.

* `critic.txt` - Critical guidelines and specific requirements that the final resume content must follow. This file contains important constraints, style preferences, and content guidelines that should be strictly adhered to in the final output.

## Step 2: Generate Markdown Content

Use an AI tool to analyze your inputs and generate:

1. `output/resume.md` - A clean markdown version of your resume that:
   - Matches keywords from the job description
   - Aligns content with career goals specified in `goals.txt`
   - Highlights relevant skills and experience
   - Follows all guidelines specified in `critic.txt`
   - Contains the exact content that will be used in the LaTeX file

## Step 3: Generate LaTeX File

1. First, understand the LaTeX template structure (`templates/resume.tex`):
   - Review the template's document class and packages
   - Understand the custom environments and commands
   - Note the section formatting and spacing rules
   - Identify customizable elements (colors, fonts, margins)
   - Review the header and footer configuration

2. Generate the LaTeX file:
   - `templates/resume.tex` - Convert the content from `output/resume.md` into the LaTeX template format
   - Maintain all content exactly as in the markdown file
   - Apply proper LaTeX formatting and styling based on the template structure
   - Ensure compatibility with pdfLaTeX engine
   - Preserve any custom styling defined in the template
   - Match the document structure with template sections

3. Key template features to maintain:
   - Professional formatting with proper margins and spacing
   - Section titles with consistent styling
   - Two-column and three-column layouts where specified
   - Custom bullet points and list environments
   - Header with contact information formatting
   - Proper handling of links and contact information
   - Consistent font sizes and styles throughout

## Step 4: Build Resume

### Using Docker (recommended)

```bash
# Generate PDF from any LaTeX file
docker-compose run resume latex /app/templates/your-resume.tex [output-name]  # Generate PDF using pdfLaTeX
docker-compose run resume clean-latex /app/templates/your-resume.tex [output-name]  # Clean and regenerate PDF

# Examples:
docker-compose run resume latex /app/templates/resume.tex my-resume  # Generates my-resume.pdf
docker-compose run resume latex /app/templates/cv.tex  # Generates cv.pdf
docker-compose run resume clean  # Clean output directory
```

The container will mount your local directory, so all changes will be immediately visible in your project folder.

Output files will be in the `output/` directory with the specified name (e.g., `output/my-resume.pdf`)

## Step 5: Review & Refine

1. Check generated files in the `output/` directory
2. Review the PDF using your preferred PDF viewer:
   ```bash
   # macOS
   open output/my-resume.pdf
   
   # Linux
   xdg-open output/my-resume.pdf
   
   # Windows
   start output/my-resume.pdf
   ```
3. Make adjustments to your LaTeX files as needed
4. Rebuild using the commands in Step 4
5. Archive your generated resume:
   ```bash
   # Copy the PDF to archive folder with company name
   cp output/my-resume.pdf archive/company-name.pdf
   
   # If duplicate exists, add a timestamp or version number
   cp output/my-resume.pdf archive/company-name-v2.pdf
   # or
   cp output/my-resume.pdf archive/company-name-$(date +%Y%m%d).pdf
   ```

## Troubleshooting

If you encounter build errors:
1. Check output logs:
   ```bash
   # View pdflatex log (contains LaTeX processing information)
   cat output/pdflatex.log
   ```

2. Debug inside the container:
   ```bash
   # Start an interactive shell in the container
   docker-compose run --entrypoint /bin/bash resume -c "cd /app && /bin/bash"
   
   # From there, run commands manually:
   cd output
   pdflatex -interaction=nonstopmode your-resume.tex
   ```

3. Verify LaTeX syntax in your .tex files
4. Check for missing packages or compilation errors in the log
5. Rebuild with appropriate command:
   ```bash
   docker-compose run resume latex /app/templates/your-resume.tex
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
