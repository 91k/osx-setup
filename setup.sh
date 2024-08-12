#!/bin/sh

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# homebrew в $PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

# git
brew install git

# nodejs, npm
brew install node

# CLI for Mac App Store
brew install mas
mas install 497799835 # xcode
mas install 946399090 # telegram lite

# install apps via homebrew
function install_app() {
    brew install --cask "${@}" 2> /dev/null || brew install "${@}" 2> /dev/null
}

brew_apps=(
    "github" # gui version
    "firefox"
    "postman"
    "visual-studio-code"
    "discord"
    "openvpn-connect"

    "warp"
    "rectangle" # window manager
    "raycast"
    "figma"
    "yandex-music"
    "adguard-vpn"
    "chatgpt"
    "vlc"
    "zoom"
    "font-hack-nerd-font"
)

for app in "${brew_apps[@]}"; do
    echo "Установка $app..."
    install_app "$app"
done

# zsh
brew install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# server: 127.0.0.1:8888
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/91k/osx-setup/master/httpd.sh)"