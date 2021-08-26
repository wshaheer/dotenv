SAVEHIST=10000
HISTSIZE=50000
HISTFILE="${HISTFILE:-${ZDOTDIR}/.zsh_history}"

ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh/zcompcache"

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=#d33682,fg=#002b36,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=#dc322f,fg=#002b36,bold'

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#586e75'

alias ls='/usr/local/bin/gls --color -h --group-directories-first'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias help=run-help

save_history() {
  if [[ ($? == 0 || $? == 130) && -n $LASTHIST && -n $HISTFILE ]]; then
    print -sr -- ${=${LASTHIST%%'\n'}}
  fi
}

command_history() {
  LASTHIST=$1

  return 2
}

_history_substring_bind() {
  bindkey "${terminfo[kcuu1]}" history-substring-search-up
  bindkey "${terminfo[kcud1]}" history-substring-search-down
  
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
}

zstyle ':completion:*' use-cache 1
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR"
zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*:*:docker:*' option-stacking 'yes'
zstyle ':completion:*:*:docker-*:*' option-stacking 'yes'

zstyle ':prezto:load' pmodule \
  'command-not-found' \
  'directory' \
  'editor' \
  'helper' \
  'spectrum' \
  'utility'

zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:editor' ps-context 'yes'
zstyle ':prezto:module:prompt' managed 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:utility:ls' color 'yes'
zstyle ':prezto:module:utility:diff' color 'yes'
zstyle ':prezto:module:utility:make' color 'yes'
zstyle ':prezto:module:utility:wdiff' color 'yes'

zstyle ':omz:plugins:keychain' agents gpg,ssh
zstyle ':omz:plugins:keychain' identities id_rsa bitbucket_rsa github_rsa gitlab_rsa sydetech_rsa

#zstyle ':omz:plugins:ssh-agent' agent-forwarding 'on'
#zstyle ':omz:plugins:ssh-agent' ssh-add-args '-K -A'

zstyle ':plugin:history-search-multi-word' clear-on-cancel 'no'
zstyle ':plugin:history-search-multi-word' reset-prompt-protect 1

if [[ ! -d "${ZINIT[BIN_DIR]}" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"

  command mkdir -p "${ZINIT[HOME_DIR]}" && command chmod g-rwX "${ZINIT[HOME_DIR]}"
  command mkdir -p "${ZINIT[COMPLETIONS_DIR]}" && command chmod g-rwX "${ZINIT[COMPLETIONS_DIR]}"
  command git clone 'https://github.com/zdharma/zinit' "${ZINIT[BIN_DIR]}" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

if [[ -f "${ZINIT[BIN_DIR]}/zinit.zsh" ]]; then
  add-zsh-hook precmd save_history
  add-zsh-hook zshexit save_history
  add-zsh-hook zshaddhistory command_history

  source "${ZINIT[BIN_DIR]}/zinit.zsh"

  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit
fi

if [[ -a "${ZINIT[BIN_DIR]}/zmodules/Src/zdharma/zplugin.bundle" ]]; then
  module_path+=( "${ZINIT[BIN_DIR]}/zmodules/Src" )

  zmodload 'zdharma/zplugin'
fi

if [[ $(tput colors 2>/dev/null) -le 256 ]]; then
  zmodload 'zsh/nearcolor'
fi

zinit snippet 'PZTM::command-not-found'
zinit snippet 'PZTM::directory'
zinit snippet 'PZTM::editor'
zinit snippet 'PZTM::helper'
zinit snippet 'PZTM::spectrum'
zinit snippet 'PZTM::terminal'
zinit snippet 'PZTM::utility'

zinit snippet 'OMZL::cli.zsh'
zinit snippet 'OMZL::clipboard.zsh'
zinit snippet 'OMZL::compfix.zsh'
zinit snippet 'OMZL::completion.zsh'
zinit snippet 'OMZL::correction.zsh'
zinit snippet 'OMZL::diagnostics.zsh'
zinit snippet 'OMZL::functions.zsh'
zinit snippet 'OMZL::git.zsh'
zinit snippet 'OMZL::grep.zsh'
zinit snippet 'OMZL::history.zsh'
zinit snippet 'OMZL::key-bindings.zsh'
zinit snippet 'OMZL::prompt_info_functions.zsh'
zinit snippet 'OMZL::misc.zsh'

zinit snippet 'OMZP::colored-man-pages'
zinit snippet 'OMZP::docker-compose'
zinit snippet 'OMZP::gem'
zinit snippet 'OMZP::git'
zinit snippet 'OMZP::git-extras'
zinit snippet 'OMZP::git-flow-avh'
zinit snippet 'OMZP::git-prompt'
zinit snippet 'OMZP::gnu-utils'
zinit snippet 'OMZP::gpg-agent'
zinit snippet 'OMZP::history'
zinit snippet 'OMZP::keychain'
zinit snippet 'OMZP::npm'
zinit snippet 'OMZP::sdk'
#zinit snippet 'OMZP::ssh-agent'

zinit ice as'completion' id-as'OMZP::docker' 
zinit snippet 'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker'

zinit ice as'completion' id-as'OMZP::gradle'
zinit snippet 'https://github.com/gradle/gradle-completion/blob/master/_gradle'

zinit light zinit-zsh/z-a-bin-gem-node
zinit light zinit-zsh/z-a-default-ice
zinit light zinit-zsh/z-a-patch-dl
zinit light zinit-zsh/z-a-readurl
zinit light zinit-zsh/z-a-submods

zinit ice as'program' from'gh-r' bpick'*darwin*' atload'eval "$(starship init zsh)"'
zinit light starship/starship

zinit ice as'program' from'gh-r' mv'direnv* -> direnv' \
  atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
  pick'direnv' src'zhook.zsh'
zinit light direnv/direnv

zinit wait'0a' lucid as'completion' id-as'system-completions' \
  atclone'print Installing system completions...; \
    mkdir -p $ZPFX/funs; \
    command cp -f /usr/share/zsh/5.7.1/functions/^_* $ZPFX/funs; \
    zinit creinstall -q /usr/share/zsh/5.7.1/functions' \
  atload'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay; \
    fpath=( ${(u)fpath[@]:#/usr/share/zsh/5.7.1/*} ); \
    fpath+=( $ZPFX/funs )' \
  atpull"%atclone" run-atpull for \
    zdharma/null

zinit wait'0b' lucid light-mode for \
  atinit'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' \
    zdharma/fast-syntax-highlighting \
  atload'_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

zinit wait'0c' lucid light-mode for \
  atload'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay; _history_substring_bind' \
    zsh-users/zsh-history-substring-search 

zinit wait'1a' lucid light-mode for \
  bindmap'^R -> ^G' \
    zdharma/history-search-multi-word

zinit load zdharma/declare-zsh
zinit load zdharma/zsh-lint
zinit load zdharma/zui

autoload -U +X compinit && compinit
