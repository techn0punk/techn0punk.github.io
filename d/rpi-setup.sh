#!/usr/bin/env bash

## for colored output
RED='\033[0;31m'
GRE='\033[0;32m'
YEL='\033[0;33m'
NC='\033[0m'


## customize installscript with these vars
INSTALL=(zsh tmux vim git ranger hostapd haveged neofetch nmap aria2 cmake)


## setting up ssh
echo -e $YEL "  + directory: " $GRE '~/.ssh' $NC
mkdir -p $HOME/.ssh
echo -e $YEL "  + authorized key ($USER): " $GRE '2048 SHA256:C1TuFvt9rXCFDr2NF6t0XaeFKMbaoSTLM845iPetbdo ssh-key (RSA)' $NC
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFsjVhmUZQkmi2c54NUUMMnEcpgEQIeW6gEuG5aVXhRVKTGI0QyovekwVvo/AyuZI+UYaj7/+iM/Rf0mtkrx5vDGpWAo5/dC6cbM5Rw6Fr9M1OKvFf3UcpaGXX42MbJEoSiHyUBiCIKQC6lQI8Mv+CCUvwO3Ii1Mkt1uLU4Wwpk36QYwI6xtG8PS8la+VUe2flndKIXHLFlrZivQJAXtiXWj05/+7IHp/kjn43IdXvzbctwP/jbOJO72qNVCge8F+jjisvemscz1hDO/kraZIJHho/bTelgnrOx+Q5NzYcQXgQBug7uMSUM+8B2V0aQPzy7AsF9f3Ynt3aE828uZCf ssh-key' >> $HOME/.ssh/authorized_keys
echo -e $YEL "  + authorized key ($USER): " $GRE '256 SHA256:4BXN9bJV9HHNvUthwCkFkPfpPqLbKWyrKKx8+pT0g6k ssh-key (ED25519)' $NC
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhOByzJ/0+UnfD7mdFKvkLzCArsz5/uAYMtA72QuJ+Z ssh-key' >> $HOME/.ssh/authorized_keys
echo -e $YEL "  + authorized key ($USER): " $GRE '2048 SHA256:3cpMSXFzjKtwSWK7vyLVuOyWOdbwiTRnhmoMRIjox5w pi@pi-hole-e97 (RSA)' $NC
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWK6I0Jsea57kYR/P5k9m5b0Vnmo1ebtEMTLs1H/4cGEPbJxsCefNKKTMnEmfCGkNTdXuW0pkEfOpmqcX2itE1+W3EfBmxDuVSfpG8SG4sSXjWwBO4R6FCziAuO88O3rWoWuWqPXQQAppJqYcaSYhFjsQJREgbR7U4J0YzafVEvJOKvfJSZdwi9hzXSshTPHCbLKr5fipYsQIX9Fd0pbxLqV7Q/d6a9REVeps38bH3edrrTSm+wdA1LHL0Y493uftVBWOJFM9+Ewf/gJcE5iW65JKuy8yrXXpQqOgByMX/lOQ6dS/Kj9JSAxuH47Cb0GwHn2hUHls8SOChR1TqE1yB pi@pi-hole-e97' >> $HOME/.ssh/authorized_keys
echo -e $YEL "  + authorized key ($USER): " $GRE '2048 SHA256:H8LoryC6hIIH40AMAGBlziFjf7ZTsSRChHoZkHFZVYk pi@raspi-bplus (RSA)' $NC
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChIPmJ5gWoYoIZlQQPNnS9hHl8qKph77bsSmS47VefeEi7+E7oxivha1IlTsFTgLuW2x1u0V7wjXizm6J2ZI4S7V/liRa7gDefnpzkkfVBWg4w+soPcptFJmVJVm3AXvu8AVE8ArY/Bx6QqlmlZrVc2KKQuJJoFchdrgZDRG7LtSGnTJ1egzOEhNiIX7pAc1mMaWyyat0+UAOi2tQ96jW8CNgSSgLtaPlxC93A+tvVYyLLur3G0qQKpym3z7Csul2Mo63c3LRpjCgeqMYgfLkp4tHkhp7tIWzrHieKc3cJFh6JpepWpeL3BzyORnHzmdkvU8Q2Y9l2l3Qg6s7/J2/x pi@raspi-bplus' >> $HOME/.ssh/authorized_keys
echo -e $YEL "  + authorized key ($USER): " $GRE '256 SHA256:Il0vns/2mhoav37OiQmcSxgqbZe0DJTqGKpIF/H9ips u0_a154@lilac (ED25519)' $NC
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILLGSG5VRUH+kewqAuuPtbzydAhY4uN3hs7wHvEajk5B u0_a154@lilac' >> $HOME/.ssh/authorized_keys

## managing packages
echo -e $RED "  * performing update" $NC
sudo apt update
echo -e $RED "  * performing full-upgrade" $NC
sudo apt full-upgrade -y
echo -e $RED "  * installing additional packages:" $GRE "\n ${INSTALL[*]}" $NC
sudo apt install -y ${INSTALL[*]}

## CONFIGURING 
echo -e $YEL "  + directory: " $GRE '~/.config' $NC
mkdir -p $HOME/.config

## installing oh-my-zsh
# exports
export ZSH=$HOME/.config/oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

# login-shell
echo -e $YEL "  * setting login-shell ($USER): " $GRE "/usr/bin/zsh" $NC
sudo chsh -s /usr/bin/zsh $USER

# main install oh-my-zsh
echo -e $YEL "  * installing " $GRE "oh-my-zsh" $NC
sh -c "$(curl -fsSL https://techn0punk.github.io/d/install-ohmyz.sh)"

# Plugin zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# remove standard .zshrc and replace with custom
# MOVED TO install-ohmyz.sh
# rm $HOME/.zshrc
# wget https://gist.githubusercontent.com/techn0punk/a80f2453b3fe86dbabb8044a68b2d0db/raw/f07683e1259684208fe79b2c0601983a3be53493/.zshrc


## installing configs
# if exists, backup ~/.vimrc and replace with custom one
echo -e $YEL "  + getting rc-file: " $GRE '~/.vimrc' $NC
if [[ -w "$HOME/.vimrc" ]]; then mv $HOME/.vimrc $HOME/.vimrc.bak; fi
wget https://techn0punk.github.io/d/vimrc -O $HOME/.vimrc

# if exists, backup ~/.tmux.conf and replace with custom one
echo -e $YEL "  + getting rc-file: " $GRE '~/.tmux.conf' $NC
if [[ -w "$HOME/.tmux.conf"]]; then mv $HOME/.tmux.conf $HOME/.tmux.conf.bak; fi
wget https://techn0punk.github.io/d/tmux.conf -O $HOME/.tmux.conf

# compile + install tmux-mem-cpu-load
echo -e $YEL "  + compile + install " $GRE 'tmux-mem-cpu-load' $NC
git clone https://github.com/thewtex/tmux-mem-cpu-load /tmp/tmcl
cd /tmp/tmcl
cmake .
make
sudo make install
cd $HOME
rm -rvf /tmp/tmcl

## finish
echo -e "\n  ende \n$RED  ende \n$YEL  ende\n$GRE  ende$NC"