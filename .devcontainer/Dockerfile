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

# ---- Create a non-root user matching the host UID/GID -------
# Files created in the bind-mounted workspace are owned by this user,
# so they end up owned by the host user instead of root.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Ubuntu 24.04 ships a default "ubuntu" user at UID 1000; remove it
# so the UID is free for our user.
RUN if id ubuntu >/dev/null 2>&1; then userdel -r ubuntu; fi \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME \
    && apt-get update \
    && apt-get install -y --no-install-recommends sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Give the new user its own TeX Live user tree.
USER $USERNAME
RUN tlmgr init-usertree \
    && tlmgr option repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2023/tlnet-final