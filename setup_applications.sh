#!/bin/bash

# Devtools

install() {
    nix profile install nixpkgs#
}
echo "Installing file system tools..."
install bat        # https://github.com/sharkdp/bat
install fd         # https://github.com/sharkdp/fd
install ripgrep    # https://github.com/BurntSushi/ripgrep
install eza        # https://github.com/eza-community/eza
install pyenv      # https://github.com/pyenv/pyenv
install zellij     # https://zellij.dev/

echo "Installing utilities"
install nushell    # https://www.nushell.sh/
install httpie     # https://httpie.io/docs/cli

echo "Installing formatters and linters"
install nixfmt-classic    # https://github.com/NixOS/nixfmt
install isort             # https://github.com/NixOS/nixfmt
install pyright           # https://github.com/NixOS/nixfmt

echo "Installing language utilities"
install yarn                         # https://yarnpkg.com/
install python311Packages.pytest     # https://docs.pytest.org/en/stable/
install python311Packages.nose       # https://nose.readthedocs.io/en/latest/testing.html
install python311Packages.black      # https://black.readthedocs.io/en/stable/

echo "Installing version control tools"
install gh      # https://cli.github.com/

install_unfree() {
    [ -n "$INSTALL_UNFREE" ] && export NIXPKGS_ALLOW_UNFREE=1 && nix profile install --impure nixpkgs#$1
}
# Applications
echo "Installing IDEs"
install_unfree jetbrains.pycharm-professional    # https://www.jetbrains.com/pycharm/
install_unfree jetbrains.datagrip                # https://www.jetbrains.com/datagrip/
install_unfree jetbrains.webstorm                # https://www.jetbrains.com/webstorm/
install_unfree jetbrains.goland                  # https://www.jetbrains.com/goland/
install_unfree gitkraken                         # https://www.gitkraken.com/
