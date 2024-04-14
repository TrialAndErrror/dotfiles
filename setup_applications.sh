#!/bin/bash
#
INSTALL_UNFREE=1

# devtools
nix profile install \
    pipenv \

    # file system tools
    bat  \
    fd  \
    eza  \

    # stuff
    mu  \
    dua \

    # formatters and linters
    nixfmt \
    isort \
    python311Packages.pytest \
    python311Packages.nose \

    # version control
    gh  \
    jujutsu \

# Applications
[ -n "$INSTALL_UNFREE" ] && nix profile install \
    jetbrains.pycharm-professional \
    jetbrains.datagrip \
    gitkraken \
    inkscape  \
