# Install required dependencies
sudo nala install awesome compton nitrogen xfce4-terminal rofi arandr

# Download and install config files

[ -f ~/.config/awesome/rc.lua ] && mv ~/.config/awesome/rc.lua ~/.config/awesome/rc.lua.old
wget -P ~/.config/awesome/ https://raw.githubusercontent.com/TrialAndErrror/dotfiles/main/.config/awesome/rc.lua

[ -f ~/.config/awesome/theme.lua ] && mv ~/.config/awesome/theme.lua ~/.config/awesome/theme.lua.old
wget -P ~/.config/awesome/ https://raw.githubusetheme.com/TrialAndErrror/dotfiles/main/.config/awesome/theme.lua

[ -f ~/.config/rofi/config.rasi ] && mv ~/.config/rofi/config.rasi ~/.config/rofi/config.rasi.old
wget -P ~/.config/rofi/ https://raw.githubusercontent.com/TrialAndErrror/dotfiles/main/.config/rofi/config.rasi

[ -f ~/.config/xfce4/terminal/terminalrc ] && mv ~/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc.old
wget -P ~/.config/xfce4/terminal https://raw.githubusercontent.com/TrialAndErrror/dotfiles/main/.config/xfce4/terminal/terminalrc
