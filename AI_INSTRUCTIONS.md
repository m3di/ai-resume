# AI-Assisted Resume Generation

This guide helps you use AI to create a professionally formatted resume based on your information and a job posting.

## Workflow Overview

1. Prepare your input files
2. Generate LaTeX files using AI
3. Build your resume in pdf format
4. Review and refine

## Step 1: Prepare Input Files

Create these markdown files in the `markdown/` directory:

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

* `knowledge.txt` - Format preferences
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

* `template.txt` - This file contains best practices and tips for crafting a strong resume. Please read it carefully before generating your resume.

## Step 2: Generate LaTeX & CSS

Use an AI tool to analyze your inputs and generate:

1. `styles/chmduquesne.tex` - LaTeX content
2. `styles/chmduquesne.css` - CSS styling

The AI should:
- Match keywords from the job description
- Highlight relevant skills and experience
- Format according to your template preferences

## Step 3: Build Resume

### Using Docker (recommended)
```bash
# Start the container and generate PDF (default action)
docker-compose up

# Or run specific commands in the container:
docker-compose run resume pdf       # Generate only the PDF
docker-compose run resume clean     # Clean the output directory
docker-compose run resume clean-pdf # Clean and regenerate the PDF
```

The container will mount your local directory, so all changes will be immediately visible in your project folder.

### Using Local Tools
```bash
make pdf       # Generate PDF
make clean     # Clean the output directory
make clean-pdf # Clean and regenerate the PDF
```

Output files will be in the `output/` directory.

## Step 4: Review & Refine

1. Check generated files in the `output/` directory
2. Review the PDF using your preferred PDF viewer:
   ```bash
   # macOS
   open output/chmduquesne.pdf
   
   # Linux
   xdg-open output/chmduquesne.pdf
   
   # Windows
   start output/chmduquesne.pdf
   ```
3. Make adjustments to the `.tex` or `.css` files as needed
4. Rebuild using the commands in Step 3

## Troubleshooting

If you encounter build errors:
1. Check output logs:
   ```bash
   # View context log (contains LaTeX processing information)
   cat output/context.log
   ```

2. Debug inside the container:
   ```bash
   # Start an interactive shell in the container
   docker-compose run --entrypoint /bin/bash resume -c "cd /app && /bin/bash"
   
   # From there, run commands manually:
   cd styles
   context chmduquesne.tex
   ```

3. Verify LaTeX syntax in `styles/chmduquesne.tex`
4. Ensure CSS is valid in `styles/chmduquesne.css`
5. Rebuild with `docker-compose up` or `make pdf`

## Docker Container Management

```bash
# Build or rebuild the container
docker-compose build

# Stop and remove containers
docker-compose down

# View container logs
docker-compose logs
```
