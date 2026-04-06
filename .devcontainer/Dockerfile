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
    # ---- LaTeX formatter ------------------------------------
    texlive-extra-utils \
    # ---- Utilities ------------------------------------------
    ca-certificates \
    curl \
    xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ---- Install lm (lmodern) from TeX Live 2023 historic mirror ----
# Ubuntu 24.04 does not ship lmodern.sty via apt; install via tlmgr.
RUN tlmgr init-usertree \
    && tlmgr option repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2023/tlnet-final \
    && tlmgr install lm