#!/bin/bash

# install stow
# https://www.gnu.org/software/stow/manual/stow.html
echo "Installing stow"
brew install stow

# install zsh
echo "Installing zsh"
brew install zsh

# change default shell to zsh
echo "Installing zsh"
chsh -s $(which zsh)

# install oh-my-zsh plugin zsh-autosuggestions
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/

# install tree
echo "Installing tree"
brew install tree

# install fzf
echo "Installing fzf"
brew install fzf

# better shell integration for fzf
echo "Installing fzf integration"
/usr/local/opt/fzf/install

# install bat for better cat and less
echo "Installing bat"
brew install bat

# install better ls
echo "Installing exa"
brew install exa

# install lazygit
echo "Installing lazygit"
brew install jesseduffield/lazygit/lazygit

# install starship
echo "Installing starship"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# install alacritty
echo "Installing alacritty"
brew install --cask alacritty

# install tmux
echo "Installing tmux"
brew install tmux

# install nvim
echo "Installing neovim"
brew install --HEAD neovim

# stow all dotfiles to $HOME (~)
echo "Stowing dotfiles to " $HOME
stow -vSt ~ zsh
stow -vSt ~ starship
stow -vSt ~ alacritty
stow -vSt ~ tmux
stow -vSt ~ nvim
