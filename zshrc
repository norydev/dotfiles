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
export PATH='/usr/local/bin:/usr/local/share:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/X11/bin:/usr/texbin:~/bin'

# Disable zsh correction
unsetopt correct_all

# To use Homebrew's directories rather than ~/.rbenv
export RBENV_ROOT=$HOME/.rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="./bin:${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${PATH}"

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

# npm
export PATH="$HOME/.npm-packages/bin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"

export NPM_TOKEN="e114b51b-3639-4055-b63e-7a834241e86d"
export PATH="/usr/local/opt/node@8/bin:$PATH"

export EDITOR="subl"
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

function switch-kubeconfig {
  cluster=${1}
  region=${2:-'europe-west1'}
  namespace=${3:-'default'}
  project=${4:-'devops-training-2'}

  if [ $# -eq 0 ] ; then
    echo -e "Usage:\n\tswitch-kubeconfig cluster-name [location] [namespace] [project]."
    return 0
  fi

  if [ "$cluster" = "stag" ] || [ "$cluster" = "staging" ] || [ "$cluster" = "staging-001" ]; then
    cluster="staging-001"
    location="europe-west1"
    project="staging-001"
    namespace="sf-staging"
  elif [ "$cluster" = "sandbox" ] ; then
    cluster="sandbox"
    location="europe-west1"
    project="sandbox-fdc770d5"
    namespace="sandbox"
  elif [ "$cluster" = "prod" ] || [ "$cluster" = "production" ] || [ "$cluster" = "production-002" ]; then
    cluster="production-002"
    location="europe-west1"
    project="prod-b9a0058f"
    namespace="production-001"
  elif [ "$cluster" = "misc" ] || [ "$cluster" = "miscellaneous-001" ]; then
    cluster="miscellaneous-001"
    location="europe-west1"
    project="misc-2dddb1c6"
    namespace="default"
  fi

  gcloud container clusters get-credentials $cluster --region $location --project $project || return 1
  kubectl config set-context $(kubectl config current-context) --namespace=$namespace
}

source '/Users/floup/code/silverfin/silverfin/bin/sfctl-completion.zsh'
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
