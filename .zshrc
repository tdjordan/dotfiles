#zpmod source-study
#typeset -g ZPLG_MOD_DEBUG=1
#zmodload zsh/zprof
#echo .zshrc
#return 0
#[[ $- == *i* ]] && echo 'Interactive' || echo 'Not interactive'
#[[ $- != *i* ]] && echo 'Not Interactive'
#echo $SHLVL

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

  ##zgen oh-my-zsh themes/arrow
  ##zgen oh-my-zsh lib/directories.zsh


### Interactive Shells ###

  #[ -f ~/.skim/shell/key-bindings.zsh ] && . ~/.skim/shell/key-bindings.zsh
  #. $HOME/.asdf/asdf.sh

  # Hook for desk activation
  #[ -n "$DESK_ENV" ] && . "$DESK_ENV" || true

#. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# gitstatus
#. ~/.gitstatus/gitstatus.prompt.zsh
#[[ -f ~/.p10k.zsh ]] && . ~/.p10k.zsh
#. ~/.powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
#PROMPT='%~%# '               # left prompt: directory followed by %/# (normal/root)
#PROMPT='%~%# '               # left prompt: directory followed by %/# (normal/root)
#RPROMPT='$GITSTATUS_PROMPT'  # right prompt: git status

# NVM Hooks
#export NVM_DIR="$HOME/.nmv"
#. "$(brew --prefix nvm)/nvm.sh"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="~/.sdkman"
#[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && . "~/.sdkman/bin/sdkman-init.sh"
#path=(/usr/local/share/zsh-completions $fpath)
#echo $path
#[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
#. $HOME/.asdf/asdf.sh
# Hook for desk activation
#[ -n "$DESK_ENV" ] && . "$DESK_ENV" || true


### zplugin
### Added by Zplugin's installer
. ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
#zplugin ice pick"async.zsh" src"pure.zsh"
#zplugin light sindresorhus/pure
#zplugin ice depth=1
#zplugin light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
zplugin ice silent wait
zplugin snippet OMZ::plugins/git/git.plugin.zsh
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zplugin ice silent wait
zplugin light zsh-users/zsh-autosuggestions
zplugin ice silent wait
zplugin light zdharma/fast-syntax-highlighting
#zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
#zplugin light trapd00r/LS_COLORS
#
## Contained configurations
#   aliases      : alias definitions
#   bash_local   : local machine specific
#   dockerfunc   : dockerized apps
for file in ~/.{bash_local,aliases,dockerfunc} ; do
  [ -f "$file" ] && zplugin ice silent wait && zplugin snippet "$file"
done

PS1="READY > "
#zplugin ice silent wait'!0' atload'prompt_example' #atload'promptinit; prompt scala3'
zplugin ice silent wait'!0' atload'!source ~/.p10k.zsh; _p9k_precmd'
zplugin load romkatv/powerlevel10k
#zplugin ice wait"2" lucid from"gh-r" mv"exa* -> exa" sbin"exa" fbin"exa"
#zplugin light ogham/exa
#zplugin ice wait'!0' pick"async.zsh" src"pure.zsh"
#zplugin light sindresorhus/pure
#zplugin ice wait'!0' atload'promptinit; prompt scala3'
#zplugin load psprint/zprompts

#zprof
#zmodload -u zsh/zprof
