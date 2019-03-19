#!/usr/bin/env bash


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'


echo -e "${YELLOW}*${NC} This script will setup your ${RED}Raspberry Pi 3${NC}"

mkdir -p $HOME/.config
mkdir -p $HOME/.ssh

echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFsjVhmUZQkmi2c54NUUMMnEcpgEQIeW6gEuG5aVXhRVKTGI0QyovekwVvo/AyuZI+UYaj7/+iM/Rf0mtkrx5vDGpWAo5/dC6cbM5Rw6Fr9M1OKvFf3UcpaGXX42MbJEoSiHyUBiCIKQC6lQI8Mv+CCUvwO3Ii1Mkt1uLU4Wwpk36QYwI6xtG8PS8la+VUe2flndKIXHLFlrZivQJAXtiXWj05/+7IHp/kjn43IdXvzbctwP/jbOJO72qNVCge8F+jjisvemscz1hDO/kraZIJHho/bTelgnrOx+Q5NzYcQXgQBug7uMSUM+8B2V0aQPzy7AsF9f3Ynt3aE828uZCf ssh-key' >> $HOME/.ssh/authorized_keys
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhOByzJ/0+UnfD7mdFKvkLzCArsz5/uAYMtA72QuJ+Z ssh-key' >> $HOME/.ssh/authorized_keys

sudo apt update
sudo apt full-upgrade -y

sudo apt install -y \
  zsh \
  tmux \
  vim \
  git \
  ranger \
  hostapd \
  haveged \
  neofetch \
  nmap \
  exa \
  aria2c


# installing oh-my-zsh
export ZSH=$HOME/.config/oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

sudo chsh -s /usr/bin/zsh pi

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Plugin zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# remove standard .zshrc and replace with custom
rm $HOME/.zshrc
wget https://gist.githubusercontent.com/techn0punk/a80f2453b3fe86dbabb8044a68b2d0db/raw/f07683e1259684208fe79b2c0601983a3be53493/.zshrc

# remove config for tmux and replace with custom one
rm $HOME/.tmux.conf
wget https://gist.githubusercontent.com/techn0punk/92dceabafa19abf54151d541155d3100/raw/1ba600ea3274783bfa230fc799e2d8fb0ac923fe/.tmux.conf

# remove config for vim and replace with custom one
rm $HOME/.vimrc
wget https://gist.githubusercontent.com/techn0punk/5216f5f96c106dabb8d8aa316d17c93b/raw/3174d970b5d9e60bd9cf8afc84588bdc1e63d705/.vimrc
