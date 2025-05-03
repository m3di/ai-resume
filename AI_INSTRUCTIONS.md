# AI-Assisted Resume Generation

This guide helps you use AI to create a professionally formatted resume based on your information and a job posting.

## Workflow Overview

1. Prepare your input files
2. Generate LaTeX files using AI
3. Build your resume in multiple formats
4. Review and refine

## Step 1: Prepare Input Files

Create these markdown files in the `markdown/` directory:

* `me.txt` - Your professional background
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
docker-compose up
```

### Using Local Tools
```bash
make all  # or: make pdf, make html, etc.
```

Output files will be in the `output/` directory.

## Step 4: Review & Refine

1. Check generated files in the `output/` directory
2. Review the PDF and HTML versions
3. Make adjustments to the `.tex` or `.css` files as needed
4. Rebuild using the commands in Step 3

## Troubleshooting

If you encounter build errors:
1. Check output logs
2. Verify LaTeX syntax in `styles/chmduquesne.tex`
3. Ensure CSS is valid in `styles/chmduquesne.css`
4. Rebuild with `docker-compose up` or `make`
