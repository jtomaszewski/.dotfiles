# Setting up OS X

- Go to Settings and configure it (preferrably, mirror old mac settings)

- `xcode-select --install`; and then install Xcode from appstore

- if on Apple Silicon:

  - `softwareupdate --install-rosetta`
  - install homebrew as in https://soffes.blog/homebrew-on-apple-silicon
  - `sudo vi /etc/paths` and add `/opt/homebrew/bin` as the first line

- Otherwise:

  - Install brew

- apps

  ```
  brew install mackup
  # Create ~/.mackup - by symlinking ~/Dropbox/Mackup or cloning repo like jtomaszewski/mackup-*

  cd osx
  ./import.sh
  ```

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

  - instal pip for python2.7 https://gist.github.com/haircut/14705555d58432a5f01f9188006a04ed
  - install powerline `pip install --user powerline-status`
  - download and install recommended font in https://github.com/romkatv/powerlevel10k#fonts and set it in Terminal and iTerm2 apps

- dotfiles

  ```
  curl https://raw.githubusercontent.com/jtomaszewski/.dotfiles/master/download.sh | sh
  ```

- set default shell to fish

  ```
  sudo (which fish) >> /etc/shells
  chsh -s (which fish)
  ```
