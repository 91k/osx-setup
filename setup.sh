#!/bin/sh

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install tree
brew install git
brew install wget
brew install jq # rich json viewing
brew install httpie # frendlier curl alternative
brew install tldr # friendlier man alternative

# Mac App Store
brew install mas # command line interface
mas install 1284863847 # Unsplash Wallpapers
mas install 497799835 # Xcode
mas install 1176624652 # Translatium https://github.com/quanglam2807/translatium

brew tap caskroom/cask
brew tap caskroom/versions

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

# random stuff
installcask telegram-desktop
installcask day-o # enhances default time widget in topbar
installcask teamviewer
installcask ccleaner
installcask vlc
installcask transmission
installcask libreoffice
installcask cakebrew
installcask spectacle

# other
installcask spotify
installcask toggl # tracking system
installcask notion
installcask imageoptim
installcask github # gui
installcask astrill # vpn

# browsers
installcask chromium
installcask firefoxdeveloperedition

# editors
installcask visual-studio-code

# devtools
installcask iterm2
installcask filezilla

# install powerline fonts
mkdir ~/tmp && cd ~/tmp
git clone https://github.com/powerline/fonts.git
cd fonts
sh -c ./install.sh
cd ~/tmp && rm -rf ./fonts

# Fira Code: monospaced font with programming ligatures
# https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions
brew tap caskroom/fonts
brew cask install font-fira-code

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set zsh as default shell
chsh -s /bin/zsh

# install extension for VS Code
function installvs() {
  code --install-extension "${@}" 2> /dev/null
}

# https://codeburst.io/top-javascript-vscode-extensions-for-faster-development-c687c39596f5
installvs emmanuelbeziat.vscode-great-icons 
installvs dracula-theme.theme-dracula
installvs CoenraadS.bracket-pair-colorizer
installvs oderwat.indent-rainbow
installvs esbenp.prettier-vscode
installvs WallabyJs.quokka-vscode
installvs xabikos.JavaScriptSnippets # ES6
installvs humao.rest-client
installvs formulahendry.auto-close-tag
installvs formulahendry.auto-rename-tag
installvs SirTori.indenticator
installvs abusaidm.html-snippets # HTML5