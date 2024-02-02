#!/bin/bash

# yaya we update it all
sudo apt update
sudo apt ugrade

# we install
sudo apt install build-essentials
sudo apt install unzip
sudo apt install zip
sudo apt install xclip
sudo apt-get install ripgrep
sudo apt install fd-find
sudo apt install luarocks
sudo apt-get install python3-pip
python3 -m pip install pynvim
sudo apt-get install pkg-config libncursesw5-dev libreadline-dev
sudo apt install mysql-server
sudo apt install fzf

wget https://github.com/jarun/nnn/releases/download/v4.9/nnn-nerd-static-4.9.x86_64.tar.gz -P ~/code
tar -xzf ~/code/nnn-nerd-static-4.9.x86_64.tar.gz
mv nnn-nerd-static nnn
sudo mv nnn /usr/local/bin/

# omg node version manager?!
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc

# we dev
if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# just golang nothing to see here
if ! command -v go &>/dev/null; then
    sudo wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -P ~/code
    sudo tar -C /usr/local -xzf ~/code/go1.21.5.linux-amd64.tar.gz
    go_path="/usr/local/go/bin"
    sudo echo 'export PATH=$PATH:'"$go_path" >> ~/.bashrc
    export PATH=$PATH:$go_path
    rm -rf ~/code/go1.21.5.linux-amd64.tar.gz
    source ~/.bashrc
fi 

# 🤓 I use vim btw
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# we config
cp -r ./nvim ~/.config/nvim
mkdir ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp -r ./tmux ~/.config/tmux

source ~/.bashrc

echo "Installed everything, please remember to install node..."
echo "Ah, also install npm neovim package afterwards"
