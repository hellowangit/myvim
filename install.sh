#! /bin/sh
dir=~/vim
olddir=~/vim_old
files="vim vimrc"

if [ -d "$olddir" ]; then
    rm -rf $olddir
fi
mkdir -p $olddir

if [ ! -d "$dir" ]; then
    mkdir $dir
fi
cd $dir

for file in $files; do
    mv ~/.$file $olddir
    ln -s $dir/$file ~/.$file
done

echo "done"
