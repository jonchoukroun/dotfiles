dir=~/.dotfiles

for f in $dir/*
do
  file=${f##*/}
  echo "Linking $file..."
  ln -s $dir/$file ~/.$file
done
