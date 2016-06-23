#!/bin/bash
cd $1
touch /tmp/playtts_dep
echo "Début de l'installation"
echo 0 > /tmp/playtts_dep

sudo apt-get install -y mplayer mpg123 lsb-release
echo "Installation mplayer"
echo 30 > /tmp/playtts_dep

if [[ $arch == "armv6l" ]]
  then
    sudo apt-get install -y libsox-fmt-mp3 sox
    sudo dpkg -i libttspico-data_1.0+git20130326-3_all.deb
    sudo dpkg -i libttspico0_1.0+git20130326-3_armhf.deb
    sudo dpkg -i libttspico-utils_1.0+git20130326-3_armhf.deb
  else
    sudo apt-get install -y libsox-fmt-mp3 sox libttspico-utils
fi

echo "Installation PicoTTS"
echo 70 > /tmp/playtts_dep

sudo usermod -a -G audio www-data
echo "Ajout de www-data dans le groupe audio"
echo 80 > /tmp/playtts_dep

echo "Fin de l'installation"
rm /tmp/playtts_dep