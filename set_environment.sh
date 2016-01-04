path=$(cd $(dirname $0); pwd)
BashProfile=$path/BashProfile
VimrcWithoutPlugin=$path/VimrcWithoutPlugin
bashrc=$HOME/.bashrc
profile=$HOME/.bash_profile

#wget
wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh

for f in $BashProfile/_*
do
    echo "source $f into $profile"
    echo "source $f" >> $profile
done
[ -f $bashrc ] || ln -s $profile $bashrc

vimrc=$HOME/.vimrc
ideavimrc=$HOME/.ideavimrc
[ -f $vimrc ] || ln -s $VimrcWithoutPlugin/_vimrc $vimrc
[ -f $ideavimrc ] || ln -s $VimrcWithoutPlugin/_vimrc $ideavimrc
