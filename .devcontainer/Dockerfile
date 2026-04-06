FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin

# ---- LaTeX + build tools -----------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Core LaTeX (covers KOMA-Script, microtype, booktabs, cleveref,
    #              hyperref, hyperxmp, biblatex, mathtools, graphicx, …)
    texlive-latex-extra \
    # Fonts (lmodern, etc.)
    texlive-fonts-recommended \
    # German babel support
    texlive-lang-german \
    # siunitx and other science packages
    texlive-science \
    # biblatex styles
    texlive-bibtex-extra \
    # Bibliography processor (required by biblatex)
    biber \
    # Build automation
    latexmk \
    make \
    # ---- Version control ------------------------------------
    git \
    # ---- SSH server -----------------------------------------
    openssh-server \
    # ---- Utilities ------------------------------------------
    ca-certificates \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*