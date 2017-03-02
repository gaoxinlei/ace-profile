#!/bin/sh
cd ~
sudo yum install -y git
git clone https://github.com/acefei/AceProfile.git
./AceProfile/Installer/set_environment.sh
