# Setting up OS X

- Go to Settings and configure it (preferrably, mirror old mac settings)

- `xcode-select --install`; and then install Xcode from appstore

- if on Apple Silicon:

    - `softwareupdate --install-rosetta`
    - install homebrew as in https://soffes.blog/homebrew-on-apple-silicon

- Otherwise:

    - Install brew

- apps
    ```
    brew cask install adobe-reader
    brew cask install battle-net
    brew cask install google-chrome
    brew cask install iterm2
    brew cask install spectacle
    brew cask install virtualbox
    brew cask install visual-studio-code

    cd osx
    ./import.sh
    ````

- Create/Import SSH private key

- Setup SSH git https authentication

    https://help.github.com/en/github/using-git/caching-your-github-password-in-git

- fish

    ```sh
    omf install
    ```

- node

    ```sh
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
    asdf install ruby 2.5.7
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
