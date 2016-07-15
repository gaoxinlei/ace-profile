path=$(cd $(dirname $0); pwd)
BashProfile=$path/BashProfile
VimrcWithoutPlugin=$path/VimrcWithoutPlugin
bashrc=$HOME/.bashrc
profile=$HOME/.bash_profile

download=''
if which wget >/dev/null 2>&1; then
    download='wget -O '
elif which curl >/dev/null 2>&1; then
    download='curl -Lo '
fi

if [ -z "$download" ];then
    echo "please install wget/curl first." 
    exit 1
else
    echo "download git-completion and git-prompt"
    $download ~/.git-completion.bash  https://raw.github.com/git/git/master/contrib/completion/git-completion.bash 
    $download ~/.git-prompt.sh        https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
fi

echo > $profile
for f in $BashProfile/_*
do
    echo "source $f into $profile"
    echo "source $f" >> $profile
done

echo "ln -sf $profile $bashrc"
ln -sf $profile $bashrc

vimrc=$HOME/.vimrc
ideavimrc=$HOME/.ideavimrc
[ -f $vimrc ] || ln -s $VimrcWithoutPlugin/_vimrc $vimrc
[ -f $ideavimrc ] || ln -s $VimrcWithoutPlugin/_ideavimrc $ideavimrc

echo "Please source ~/.bash_profile"
