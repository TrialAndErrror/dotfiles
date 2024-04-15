#!/bin/bash

INSTALL_UNFREE=1

# Devtools

echo "Installing file system tools..."
nix profile install nixpkgs#bat nixpkgs#fd nixpkgs#eza nixpkgs#pipenv

echo "Installing utilities"
nix profile install nixpkgs#mu nixpkgs#dua nixpkgs#nushell

echo "Installing formatters and linters"
nix profile install nixpkgs#nixfmt nixpkgs#isort nixpkgs#python311Packages.pytest nixpkgs#python311Packages.nose


echo "Installing version control tools"
nix profile install nixpkgs#gh nixpkgs#jujutsu

# Applications
[ -n "$INSTALL_UNFREE" ] && nix profile install nixpkgs#jetbrains.pycharm-professional nixpkgs#jetbrains.datagrip nixpkgs#gitkraken
