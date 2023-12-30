#!/bin/bash
cd $1
touch /tmp/playtts_dep
echo "Début de l'installation"
echo 0 > /tmp/playtts_dep

echo "Installation mplayer"
echo 30 > /tmp/playtts_dep
sudo apt-get install -y -q mplayer mpg123 lsb-release software-properties-common

echo "Installation PicoTTS"
echo 70 > /tmp/playtts_dep
sudo add-apt-repository non-free
sudo add-apt-repository contrib
sudo apt-get update
sudo apt-get install -y libsox-fmt-mp3 sox libttspico-utils

echo "Ajout de www-data dans le groupe audio"
echo 90 > /tmp/playtts_dep
sudo usermod -a -G audio `whoami`

echo "Fin de l'installation"
rm /tmp/playtts_dep
