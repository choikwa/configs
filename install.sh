cat .bashrc >>$HOME/.bashrc
wd=`pwd`
ln -sf $wd/.gitconfig $HOME/.gitconfig
ln -sf $wd/.vimrc $HOME/.vimrc

