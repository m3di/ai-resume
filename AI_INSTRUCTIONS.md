Ai Steps
===================

### Step1

generate markdown/resume.md file based on the description inside it

```
you have to generate resume.md file text to be replaced
later we want to generate a tex template and it style to render it to pdf
in the next step i want to generate that so you can improve the md formatting to later pick it up by tex template
```

#### step 2

now update the styles/chmduquesne.tex and styles/chmduquesne.css to display a professional resume with classic theme in pdf

```
now update the styles/chmduquesne.tex and styles/chmduquesne.css to display a professional resume with classic theme in pdf
```

#### Step 3

now everything is ready give it a shot at generating tex and pdf

```bash
docker-compose up -d
```


### Step 4

the outputs and the results are added in the /output directory

```
in this step you need to fix the posible tex errors in the /output/resume.log
and ubdate tex file to fix them and the again run "docker-compose up -d" to check if it is fixed
```
