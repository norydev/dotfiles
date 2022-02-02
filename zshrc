# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look at https://github.com/robbyrussell/oh-my-zsh/wiki/themes for alternatives
ZSH_THEME="robbyrussell"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git sublime zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh
export PATH='/usr/local/bin:/usr/local/share:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/texbin:~/bin'

# Disable zsh correction
unsetopt correct_all

# Gather handy aliases
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Enhance history with substring search and purple highlighting
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# UTF-8 is our default encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Android studio
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# added by travis gem
[ -f /Users/floup/.travis/travis.sh ] && source /Users/floup/.travis/travis.sh

export PATH="$HOME/.yarn/bin:$PATH"

export EDITOR="subl"
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

# openssl
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# node
eval "$(nodenv init -)"
export PATH="$HOME/.nodenv/bin:$PATH"

# ruby
# Load rbenv if installed (to manage your Ruby versions)
export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
type -a rbenv > /dev/null && eval "$(rbenv init - zsh)"
