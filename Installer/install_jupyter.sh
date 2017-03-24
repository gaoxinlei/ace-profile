#sudo pip install jupyter
jupyter notebook --generate-config
jupyter_default_conf=~/.jupyter/jupyter_notebook_config.py
jupyter_default_pwd=~/.jupyter/jupyter_notebook_config.json
default_port=8888
defaut_pwd=juPyter
notebook_dir=~/jupyter_notebook_root
mkdir -p $notebook_dir


read -p "Jupyter port [$default_port]:" jupyter_port
[ "$jupyter_port" == '' ] && jupyter_port=$default_port
sed -i '/ c.NotebookApp.port / ac.NotebookApp.port = '$jupyter_port'' $jupyter_default_conf

read -p "Jupyter root path [$notebook_dir]:" jupyter_root
[ "$jupyter_root" == '' ] && jupyter_root=$notebook_dir
sed -i '/ c.NotebookApp.notebook_dir / ac.NotebookApp.notebook_dir = u"'$jupyter_root'"' $jupyter_default_conf

read -p "Set a password for logining jupyter [$defaut_pwd]:" unauth_pwd
[ "$unauth_pwd" == '' ] && unauth_pwd=$defaut_pwd
jupyter_password=$(python -c "from notebook.auth import passwd; print passwd('$unauth_pwd')")
sed -i '/ c.NotebookApp.password / ac.NotebookApp.password = u"'$jupyter_password'"' $jupyter_default_conf

# Set all ip addresses on your system are available  
sed -i '/ c.NotebookApp.ip / ac.NotebookApp.ip = "*"' $jupyter_default_conf

# Jupyter start in silence
sed -i '/ c.NotebookApp.open_browser / ac.NotebookApp.open_browser = False' $jupyter_default_conf

echo
echo "Jupyter installation complete, please use 'jupyter notebook' to start it."
