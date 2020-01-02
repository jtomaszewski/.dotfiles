#!/bin/bash

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

  # # Remove if it's a symlink
  if [[ -h $target ]]; then
    echo "Existing symlink to \"$filename\" has been removed."
    rm $target
  fi

  # # Move, if it exists
  if [[ -e $target ]]; then
    echo "Existing \"$filename\" has been moved to \"$backup\"."
    mv $target $backup
  fi

  echo "Creating symlink to \"$filename\" in home directory."
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
