#!/usr/bin/bash
current_dir=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
source $current_dir/precondition.sh

sudo pip install charmy
sudo charmy install --destination=/opt/PyCharm
echo "alias pyc='/opt/PyCharm/pycharm-latest.sh  > /dev/null 2>&1 &'" >> ~/.bash_profile

echo 
echo "Please run 'source ~/.bash_profile' to goes into effect."
echo "Tips: run 'pyc' to start pycharm..."
