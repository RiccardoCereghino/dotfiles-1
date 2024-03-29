#!/bin/bash
# Installs

# basics
apt install curl cmake git i3 vim

# fonts
apt install fonts-powerline
apt install fonts-font-awesome

# i3 gaps
apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake libxcb-shape0-dev

# terminal
apt install kitty

# background
apt install feh

# polybar
apt install libxcb-composite0 libxcb-composite0-dev libdssialsacompat-dev
apt install libsdl2-dev libcurl4-openssl-dev
apt install libiw-dev
apt install libxcb-*
apt install python-xcbgen
apt install xcb-proto
apt install libjsoncpp-dev
apt install libmpdclient

# compton
apt install compton

# conky
apt install conky

# rofi
apt install rofi

# i3-gaps libraries
mkdir tmp
cd tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
make install

cd ~

# i3 gaps installation
cd tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install

cd ~

curl https://cdn.discordapp.com/attachments/312588502917316619/577412922456801297/7ee4755.jpg --create-dirs -o $HOME/.walls/wall.png

# polybar
cd tmp
git clone https://github.com/polybar/polybar.git
cd polybar
./build.sh
