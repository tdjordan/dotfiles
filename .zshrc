#zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME=""
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
#plugins+=(zsh-completions)
#autoload -U compinit && compinit
#plugins+=(mercurial)
plugins+=(osx)
#plugins+=(dotenv)
#plugins+=(autoenv)

# User configuration

export PATH=/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:~/.gopath/bin
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.files/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/go/bin
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
#source $ZSH/plugins/git/git.plugin.zsh
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# gitstatus
#source ~/.gitstatus/gitstatus.prompt.zsh
#[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
#source ~/.powerlevel10k/powerlevel10k.zsh-theme
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
#PROMPT='%~%# '               # left prompt: directory followed by %/# (normal/root)
#PROMPT='%~%# '               # left prompt: directory followed by %/# (normal/root)
#RPROMPT='$GITSTATUS_PROMPT'  # right prompt: git status

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
## Contained configurations
#   bash_aliases : alias definitions
#   bash_local   : local machine specific
#   dockerfunc   : dockerized apps
for file in ~/.{bash_local,bash_aliases,dockerfunc} ; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done

# NVM Hooks
#export NVM_DIR="$HOME/.nmv"
#. "$(brew --prefix nvm)/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="~/.sdkman"
#[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"

#path=(/usr/local/share/zsh-completions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#export PATH="/usr/local/opt/sqlite/bin:$PATH"
#export PATH="/usr/local/opt/gettext/bin:$PATH"

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/Cellar/terraform/0.11.8/bin/terraform terraform

#eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

. $HOME/.asdf/asdf.sh
# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true


#zprof

