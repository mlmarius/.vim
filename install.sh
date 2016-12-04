#!/usr/bin/zsh
backup_dir=~/vim.old

rm -Rf $backup_dir
mkdir $backup_dir

echo "Making backups to $backup_dir"
cp -r ~/.vim $backup_dir/ && cp ~/.vimrc $backup_dir/
backup_ok=$?

if [ $backup_ok -ne 0 ];then
    echo "Could not backup vim files to $backup_dir. Exiting"
    exit 1
else
    echo "Backup complete"
fi

echo "$backup_dir contents:"
ls -la $backup_dir

rm -Rf ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/backup
mkdir ~/.vim/bundle
mkdir ~/.vim/colors
mkdir ~/.vim/swap

echo "Installing pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing nerdtree"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

echo "Installing airbar"
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

echo "Fetching PaperColor Theme"
git clone https://github.com/NLKNguyen/papercolor-theme.git /tmp/vim.papercolor
mkdir ~/.vim/colors
mv /tmp/vim.papercolor/colors/PaperColor.vim ~/.vim/colors/
rm -Rf /tmp/vim.papercolor

echo "Adding custom .vimrc"
