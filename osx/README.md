# Setting up OS X

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
    brew cask install magicprefs
    ````

- Create/Import SSH private key

- Setup SSH git https authentication

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

- asdf

    ```
    brew install asdf
    ```

- dotfiles

    ```
    curl https://raw.githubusercontent.com/jtomaszewski/.dotfiles/master/download.sh | sh
    ```

- set default shell to fish

    ```
    sudo (which fish) >> /etc/shells
    chsh -s (which fish)
    ```

- import default settings

    ```
    cd ~/.dotfiles/osx
    ./import.sh
    ```

# Thanks to

* http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
* http://crosbymichael.com/remote-development.html



