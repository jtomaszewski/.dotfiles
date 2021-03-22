#!/bin/bash

readlink_cmd="readlink"
if [[ $OSTYPE == darwin* ]]; then
  # Use greadlink on the mac
  readlink_cmd="greadlink"
fi

timestamp() {
  date +"%s"
}

########## Config
DOTFILES_REPOSITORY_DIR="$HOME/.dotfiles"
DOTFILES_DIR="$DOTFILES_REPOSITORY_DIR/dotfiles"
BACKUP_DIR="$DOTFILES_REPOSITORY_DIR/old/`timestamp`"
##########

echo "Existing dotfiles will be moved to $BACKUP_DIR."
mkdir -p $BACKUP_DIR

create_symlink() {
  source=$1
  target=$2
  backup=$3
  filename=`basename $source`

  # If it's a symlink
  if [[ -h $target ]]; then
    root=$($readlink_cmd -f $target)
    # If it's a symlink leading to ~/.dotfiles, remove it
    if [[ $root == $DOTFILES_REPOSITORY_DIR/* ]]; then
      echo "Removing symlink to \"$filename\" located in \"$target\"."
      rm $target
    # Otherwise, find the root of that link, and use that as the target for the symlink
    else
      create_symlink $source $root $backup
      return
    fi
  fi

  # Move, if it exists
  if [[ -e $target ]]; then
    mv $target $backup
    echo "Moving existing \"$target\" to \"$backup\"."
  fi

  echo "Creating symlink to \"$target\" in \"$source\"."
  ln -s $source $target
}

for file in $DOTFILES_DIR/.* $DOTFILES_DIR/*; do
  filename=`basename $file`

  # Skip .config directory
  if [ "$filename" = "*" ] || [ "$filename" = "." ] || [ "$filename" = ".." ] || [ "$filename" = ".config" ]; then
    continue
  fi

  create_symlink $file "$HOME/$filename" "$BACKUP_DIR/$filename"
done

# # We'll handle .config files recursively
mkdir -p $HOME/.config
for subdirectory in .config; do
  for file in $DOTFILES_DIR/$subdirectory/.* $DOTFILES_DIR/$subdirectory/*; do
    filename=`basename $file`

    # Skip .config directory
    if [ "$filename" = "*" ] || [ "$filename" = "." ] || [ "$filename" = ".." ]; then
      continue
    fi

    mkdir -p "$BACKUP_DIR/$subdirectory"
    create_symlink $file "$HOME/$subdirectory/$filename" "$BACKUP_DIR/$subdirectory/$filename"
  done
done
