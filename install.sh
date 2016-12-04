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
mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/backup
mkdir ~/.vim/bundle
mkdir ~/.vim/colors
mkdir ~/.vim/swap
mkdir ~/.vim/syntax

echo "Installing pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing nerdtree"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

echo "Installing airbar"
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

echo "Fetching PaperColor Theme"
git clone https://github.com/NLKNguyen/papercolor-theme.git /tmp/vim.papercolor
mv /tmp/vim.papercolor/colors/PaperColor.vim ~/.vim/colors/
rm -Rf /tmp/vim.papercolor

echo "Installing python highlighting"
git clone https://github.com/hdima/python-syntax.git /tmp/vim.python
mv /tmp/vim.python/syntax/python.vim ~/.vim/syntax/
rm -Rf /tmp/vim.python

echo "Adding custom .vimrc"
git clone https://github.com/mlmarius/.vim.git /tmp/vim.customisations
mv /tmp/vim.customisations/.vimrc ~/.vimrc
rm -Rf /tmp/vim.customisations

echo "Adding Raimodi/delimitMate"
git clone https://github.com/Raimondi/delimitMate.git ~/.vim/bundle/delimit-mate

echo "Adding tcomment"
git clone https://github.com/tomtom/tcomment_vim.git ~/.vim/bundle/tcomment

echo "Adding MRU plugin"
git clone https://github.com/yegappan/mru.git ~/.vim/bundle/mru


# Plugin Command-T https://github.com/wincent/command-t  !! verry nice fuzzy finder but requires ruby

echo "Adding SnipMate"
cd ~/.vim/bundle
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git

# Copy some snippets
git clone https://github.com/honza/vim-snippets.git
git clone https://github.com/rbonvall/snipmate-snippets-bib 
git clone https://github.com/sudar/vim-arduino-snippets 
git clone https://github.com/zedr/zope-snipmate-bundle.git 
git clone https://github.com/bonsaiben/bootstrap-snippets 
git clone https://github.com/sniphpets 

