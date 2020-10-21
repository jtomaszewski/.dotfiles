# Description

- 3 tweaked shells: oh-my-fish, oh-my-zsh, bash-it. Default is **bash**, but if you'll install **zsh** or **fish2**, it will be tweaked automatically. `bash_profile` is configured in a way that it launches zsh automatically, if it exists on the machine.
- useful shell aliases
- my custom .gitconfig and .gitignore_global
- some useful tweaks in .pryrc, .rspec, .bashrc, .zshrc, tmux.conf, dir_colors and other files (see them all in `create_symlinks.sh`)

### How to install?

```bash
TMPF=$(mktemp)
curl https://raw.githubusercontent.com/jtomaszewski/.dotfiles/master/download.sh > $TMPF && sh $TMPF
```

For setting up your OS X machine from scratch, see `osx/README.md` .

### Scripts description

- init.sh - bootstraps all installation. Everything is done by a user prompt dialog - don't worry, it won't do antyhing if you keep pressing `n`.
- install.sh - updates the .dotfiles repo and run `create_symlinks.sh`
- create_symlinks.sh - creates the symlinks to dotfiles, moving the existing to ./old/ directory

# Thanks to

- http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
- http://crosbymichael.com/remote-development.html
