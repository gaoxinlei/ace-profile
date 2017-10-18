## Installation:
```
curl -sL https://raw.githubusercontent.com/acefei/ace-profile/master/installer/install.sh | sh
```
> You need to modify $HOME/.gitconfig for github user info 


## Feature
1. git command completion
2. [fzf is a general-purpose command-line fuzzy finder](https://github.com/junegunn/fzf)      
```
    CTRL-T - Paste the selected files and directories onto the command line
        Set FZF_CTRL_T_COMMAND to override the default command
        Set FZF_CTRL_T_OPTS to pass additional options
    CTRL-R - Paste the selected command from history onto the command line
        Sort is disabled by default to respect chronological ordering
        Press CTRL-R again to toggle sort
        Set FZF_CTRL_R_OPTS to pass additional options
    ALT-C - cd into the selected directory
        Set FZF_ALT_C_COMMAND to override the default command
        Set FZF_ALT_C_OPTS to pass additional options
```
3. Vagrantfile for centos7      
4. Dockerfile     
   > jenkins       

## Vim with plug
please custom [_vimrc](https://github.com/acefei/ace-profile/master/vimrcs/_vimrc) as you wish
    
## Reference
> [.bashrc and .bash_profile](http://tldp.org/LDP/abs/html/sample-bashrc.html)<br>
> [junegunn/dotfiles](https://github.com/junegunn/dotfiles)<br>
> [junegunn/vim-plug](https://github.com/junegunn/vim-plug)<br>
