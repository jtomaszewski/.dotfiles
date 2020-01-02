# Description

* 3 tweaked shells: oh-my-fish, oh-my-zsh, bash-it. Default is **bash**, but if you'll install **zsh** or **fish2**, it will be tweaked automatically. `bash_profile` is configured in a way that it launches zsh automatically, if it exists on the machine.
* useful shell aliases
* my custom .gitconfig and .gitignore_global
* some useful tweaks in .pryrc, .rspec, .bashrc, .zshrc, tmux.conf, dir_colors and other files (see them all in `create_symlinks.sh`)

### How to install?

```bash
curl https://raw.githubusercontent.com/jtomaszewski/.dotfiles/master/download.sh | sh
```

### Scripts description

* init.sh - bootstraps all installation. Everything is done by a user prompt dialog - don't worry, it won't do antyhing if you keep pressing `n`.
* update.sh - updates the .dotfiles repo and run `create_symlinks.sh`
* create_symlinks.sh - creates the symlinks to dotfiles, moving the existing to ./old/ directory

### Additional stuff to be done on OS X

- `xcode-select --install`; and then install Xcode from appstore

- Install brew

- apps
    ```
    brew cask install adobe-reader
    brew cask install battle-net
    brew cask install calibre
    brew cask install discord
    brew cask install firefox
    brew cask install google-chrome
    brew cask install iterm2
    brew cask install keka
    brew cask install kindle
    brew cask install skype
    brew cask install spectacle
    brew cask install spotify
    brew cask install transmission
    brew cask install virtualbox
    brew cask install visual-studio-code
    brew cask install vlc
    ````

- ssh private key

- ssh git https authentication

    https://help.github.com/en/github/using-git/caching-your-github-password-in-git

- fish

    ```sh
    brew install fish
    omf install
    ```

- node

    ```sh
    brew install nodenv
    nodenv install -l
    nodenv install 123 # set ver here
    nodenv global 123
    ```

- powerline
    - install powerline python lib http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
    - download and install https://github.com/supermarin/powerline-fonts/tree/master/Monaco


- postgres

    ```
    brew install postgresql
    ```

# Thanks to

* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
* http://crosbymichael.com/remote-development.html



