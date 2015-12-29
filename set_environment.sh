path=$(dirname $0)
BashProfile=$path/BashProfile
VimrcWithoutPlugin=$path/VimrcWithoutPlugin
bashrc=$HOME/.bashrc
profile=$HOME/.bash_profile
[ -f $profile ] || touch $profile
for f in $BashProfile/_*
do
    echo "source $f >> $profile"
    echo "source $f" >> $profile
done

[ -f $bashrc ] || ln -s $profile $bashrc

cp -f $VimrcWithoutPlugin/_vimrc $HOME/.vimrc
