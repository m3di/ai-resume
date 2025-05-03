## AI Integration Steps

---

### Step 1: Understand the Context

To generate a relevant and well-structured resume, start by reading the following files:

* `markdown/me.txt`

  > Contains personal and professional background, including how to interpret and prioritize my information.

* `markdown/jobposting.txt`

  > The target job description and requirements to tailor the resume accordingly.

* `markdown/template.txt`

  > Specifications and structure for how the resume should be formatted using LaTeX and styling guidelines.

---

### Step 2: Generate LaTeX Resume and Style Files

Based on the information above, generate the following:

* `styles/chmduquesne.tex`

  > The LaTeX source for the resume content.

* `styles/chmduquesne.css`

  > Styling rules to ensure a clean, professional, and classic resume layout.

Ensure that the output:

* Highlights relevant experience and skills for the job posting
* Matches the template specification
* Produces a well-formatted LaTeX structure ready for PDF rendering

---

### Step 3: Compile and Review

Generate the PDF resume using Docker:

```bash
docker-compose up -d
```

This will:

* Compile the LaTeX source
* Apply the CSS styles
* Produce a PDF file in the `/output` directory

---

### Step 4: Debug and Improve

Check for any LaTeX errors or formatting issues:

**Log file to check:**

```
/output/resume.log
```

If issues are found:

1. Edit the `.tex` or `.css` files to correct them
2. Re-run the build process:

   ```bash
   docker-compose up -d
   ```

Repeat as needed until the PDF is error-free and visually polished.
