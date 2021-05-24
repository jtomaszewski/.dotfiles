if test -d /Users/jacek/Library/Python/2.7/bin
    set -x PATH /Users/jacek/Library/Python/2.7/bin $PATH
end

if test -d $HOME/.bin
    set -x PATH $HOME/.bin $PATH
end

set -q LANG; or export LANG=en_US.UTF-8

. $HOME/.dotfiles/custom/aliases.fish
if test -f $HOME/.dotfiles/custom/config.fish
    . $HOME/.dotfiles/custom/config.fish
end

set -U __done_notify_sound 1

set TERM xterm-256color

if command -v direnv &>/dev/null
    direnv hook fish | source
end

if test -d /opt/homebrew/opt/openjdk@11/bin
    set -x JAVA_HOME /opt/homebrew/opt/openjdk@11
    set -g fish_user_paths "$JAVA_HOME/bin" $fish_user_paths
end

set -x EDITOR vim

# Colors in `less`!
# Thanks to:
# - https://github.com/fish-shell/fish-shell/issues/600 (@ridiculousfish)
set -x LESS_TERMCAP_mb \e'[01;31m' # begin blinking
set -x LESS_TERMCAP_md \e'[01;38;5;74m' # begin bold
set -x LESS_TERMCAP_me \e'[0m' # end mode
set -x LESS_TERMCAP_se \e'[0m' # end standout-mode
set -x LESS_TERMCAP_so \e'[38;5;246m' # begin standout-mode - info box
set -x LESS_TERMCAP_ue \e'[0m' # end underline
set -x LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

set -g fish_user_paths "/opt/boxen/homebrew/opt/ab/bin" $fish_user_paths

set -x ANDROID_SDK /Users/$USER/Library/Android/sdk

set PATH $PATH /Users/$USER/Library/Android/sdk/platform-tools
