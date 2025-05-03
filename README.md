The Markdown Resume
===================

### Instructions

```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
```

Prepare your input files:

* `markdown/me.txt` — Your personal and professional background
* `markdown/jobposting.txt` — The target job description
* `markdown/template.txt` — Resume layout and formatting specification

Once these are ready, proceed to generate the `.tex` and style files using your AI or automated tools.

---

### Building Resume (Local)

Compile the LaTeX resume and output the PDF:

```bash
make
```

Or generate specific formats:

```bash
make pdf
make html
```

---

### Building Resume (Dockerized)

```bash
docker-compose up -d
```

This will compile the LaTeX resume and place the output in the `/output` directory.

---

### Requirements

If not using Docker, install the following dependencies:

* ConTeXt 0.6x
* Pandoc 2.x *(if you still want to generate from Markdown, optional)*

Tested with the above versions. Later versions may work, but are unverified.

---

### Installing Dependencies

#### Debian / Ubuntu

```bash
sudo apt install pandoc context
```

#### Fedora

```bash
sudo dnf install pandoc texlive-collection-context
```

#### Arch

```bash
sudo pacman -S pandoc texlive
```

#### macOS

```bash
brew install pandoc
brew install --cask mactex
```

Add TeX binaries to your `PATH`:

```bash
export PATH=$PATH:/Library/TeX/texbin/
```

#### Nix

Enable flakes, then run:

```bash
nix build
```

Output will appear in `./result`.

---

### Troubleshooting

#### Check Versions

```bash
context --version
pandoc --version
```

#### ConTeXt Not Found

If you get errors like `Cannot find context.lua`, try:

```bash
mtxrun --generate
```

More details: [texlive-2011-context-problem](https://tex.stackexchange.com/questions/53892/texlive-2011-context-problem)

---

Would you like this `README.md` turned into a PR or patch for your Git project?
