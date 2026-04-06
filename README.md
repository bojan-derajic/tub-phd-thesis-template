# TU Berlin PhD Thesis Template

A minimalistic LaTeX dissertation template for TU Berlin, Faculty IV — Electrical Engineering and Computer Science. Produces a two-sided A4 PDF using KOMA-Script (`scrbook`), with a compliant German title page and support for both English and German abstracts.

## Instructions

The template can be used in three different ways:

### Overleaf
Simply upload the template as a new Overleaf project and the template is ready to use.

### Dev Container
Requires Docker and VS Code with the Dev Containers extension. Open the repository and select *Reopen in Container*. The container provides:
- TeX Live (full science/extra packages, biber, latexmk)
- VS Code extensions: LaTeX Workshop (auto-build on save), Makefile Tools

### Ubuntu/Debian machine
To install necessary requirements on Ubuntu/Debian run:
```
sudo apt install texlive-latex-extra texlive-fonts-recommended \
  texlive-lang-german texlive-science texlive-bibtex-extra \
  biber latexmk make
```

## Repository layout

```
thesis.tex          Main file — metadata and document structure
titlepage.tex       Title page (reads metadata from thesis.tex)
chapters/
  abstract.tex      German Zusammenfassung + English abstract
  ch01_introduction.tex
  ch02_background.tex
appendix/
  app_a.tex
figures/            Place all images here
references.bib      BibTeX/biblatex bibliography
Makefile            Build automation
build/              Auxiliary files (generated, not committed)
```

## Getting started

1. **Set your metadata** in [thesis.tex](thesis.tex) (lines 19–31):

   ```latex
   \newcommand{\thesisTitle}{Your Thesis Title}
   \newcommand{\thesisAuthor}{Your Name}
   \newcommand{\thesisAuthorDegree}{M.\,Sc.}
   \newcommand{\thesisORCID}{}           % optional
   \newcommand{\thesisChairperson}{Prof.\,Dr. Name}
   \newcommand{\thesisReviewerA}{Prof.\,Dr. Name}
   \newcommand{\thesisReviewerB}{Prof.\,Dr. Name}
   \newcommand{\thesisDefenseDate}{DD. Month YYYY}
   \newcommand{\thesisYear}{YYYY}
   ```

2. **Write your content** — edit the files in `chapters/` and `appendix/`. Add new chapters by creating `chapters/ch03_methods.tex` (etc.) and uncommenting the corresponding `\include` lines in `thesis.tex`.

3. **Add references** to `references.bib` using standard BibTeX format.

4. **Build** (see below).

## Building

| Command | Effect |
|---|---|
| `make` | Build `thesis.pdf` (uses latexmk — handles biber + multiple pdflatex runs) |
| `make clean` | Remove auxiliary files, keep PDF |
| `make distclean` | Remove everything including PDF |
| `make manual` | Fallback build without latexmk |

The PDF is written to `build/` and copied to `thesis.pdf` in the root.

In VS Code with LaTeX Workshop, the thesis rebuilds automatically on every save.

## PDF/A submission

For library submission requiring PDF/A, add the following line to `thesis.tex` **before** the `hyperref` package:

```latex
\usepackage[a-2b]{pdfx}
```

See the TU Berlin library guidelines for submission requirements.

## Packages included

| Package | Purpose |
|---|---|
| `scrbook` (KOMA-Script) | Document class with typographic defaults |
| `biblatex` + biber | Bibliography (numeric style, sorted by citation order) |
| `hyperref` + `hyperxmp` | PDF metadata and internal links |
| `cleveref` | Smart cross-references (`\cref`) |
| `amsmath`, `amssymb`, `mathtools` | Mathematics |
| `siunitx` | SI units |
| `booktabs` | Publication-quality tables |
| `microtype` | Microtypographic improvements |
| `babel` (english + ngerman) | Language support for bilingual abstract |
