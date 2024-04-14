#!/bin/bash

INSTALL_UNFREE=1

# Devtools
nix profile install \

    # file system tools
    bat  \
    fd  \
    eza  \

    # environment management
    pipenv \

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
