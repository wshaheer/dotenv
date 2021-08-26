export LC_ALL="en_CA.UTF-8"
export LANG="en_CA.UTF-8"
export LANGUAGE="en_CA.UTF-8"

export TERM='xterm-256color'
export SHELL='/usr/local/bin/zsh'
export EDITOR='/usr/local/bin/vim'

export ZDOTDIR="$HOME"
export ZPLG_MOD_DEBUG=1

export XDG_STATE_HOME="${HOME}/.var/log"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_RUNTIME_DIR="${HOME}/.var/run"

export GH_TOKEN="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"

export VAGRANT_DEFAULT_PROVIDER="virtualbox"

export HOMEBREW_COLOR='true'
export HOMEBREW_EDITOR="$EDITOR"
export HOMEBREW_DEVELOPER='true'
export HOMEBREW_FORCE_BREWED_CURL='true'
export HOMEBREW_FORCE_BREWED_GIT='true'

export HOMEBREW_PREFIX='/usr/local'
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_CASKROOM="${HOMEBREW_PREFIX}/Caskroom"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"

export HOMEBREW_CASK_OPTS="--appdir=${HOME}/Applications/Homebrew --fontdir=${HOME}/Library/Fonts"

export HOMEBREW_RUBY_PATH="${HOMEBREW_PREFIX}/opt/ruby/bin"
export HOMEBREW_BUNDLE_FILE="${XDG_CONFIG_HOME}/homebrew/Brewfile"

export HB_CNF_HANDLER="${HOMEBREW_REPOSITORY}/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${HOMEBREW_PREFIX}/opt/openssl@1.1"

export SDKMAN_DIR='/opt/sdkman'
export JAVA_HOME="${SDKMAN_DIR}/candidates/java/current"
export MAVEN_HOME="${SDKMAN_DIR}/candidates/maven/current"
export ANDROID_SDK_HOME="${HOME}/Library/Android"
#export GRADLE_HOME="${SDKMAN_DIR}/candidates/gradle/current"

export RUSTUP_HOME='/opt/rustup'
export CARGO_HOME='/opt/cargo'

export GOROOT='/usr/local/opt/go/libexec'
export GOPATH="${HOME}/Development/Sources/Workspace/go"

export NODENV_ROOT='/opt/nodenv'
export NODENV_SHELL='zsh'

export NODENV_HOOK_PATH="${NODENV_ROOT}/plugins/nodenv-package-rehash/etc/nodenv.d"

export HELPDIR='/usr/local/share/zsh/help'

export VIMPLUG_HOME='/opt/vim'
export SPACEVIMDIR='/opt/spacevim'

export MAGICK_HOME='/usr/local/opt/imagemagick'

export GUILE_TLS_CERTIFICATE_DIRECTORY='/usr/local/etc/gnutls'
export XML_CATALOG_FILES='/usr/local/etc/xml/catalog'

export GOKU_EDN_CONFIG_FILE="${XDG_CONFIG_HOME}/karabiner/karabiner.edn"

export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"

export NODE_BUILD_CACHE_PATH="${XDG_CACHE_HOME}/node/build"

typeset -TLRU -agx PATH path ':'
typeset -TLRU -agx CPATH cpath ':'
typeset -TLRU -agx FPATH fpath ':'
typeset -TLRU -agx MANPATH manpath ':'
typeset -TLRU -agx INFOPATH infopath ':'
#typeset -TLRU -agx PKG_CONFIG_PATH pkg_config_path ':'
#typeset -TLRU -agx LD_LIBRARY_PATH ld_library_path ':'
#typeset -TLRU -agx DYLD_LIBRARY_PATH dyld_library_path ':'
typeset -TLRU -agx DYLD_FALLBACK_LIBRARY_PATH dyld_fallback_library_path ':'

#typeset -TLRU -agx CFLAGS cflags ' '
#typeset -TLRU -agx LDFLAGS ldflags ' '
#typeset -TLRU -agx CPPFLAGS cppflags ' '

typeset -TLRU -agx PYTHONHOME pythonhome ':'
typeset -TLRU -agx PYTHONPATH pythonpath ':'

typeset -TLRU -agx NODE_BUILD_DEFINITIONS node_build_definitions ':'

typeset -gx NVM_BIN

declare -A -gx ZINIT

ZINIT[HOME_DIR]='/opt/zsh'
ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
ZINIT[MODULES_DIR]="${ZINIT[BIN_DIR]}/zmodules"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[SERVICES_DIR]="${ZINIT[HOME_DIR]}/services"
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/.cache}/zsh/zcompdump"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"

# ZSH Shell
setopt CORRECT
setopt RM_STAR_WAIT
setopt PROMPT_SUBST
setopt EXTENDED_GLOB

# ZSH History
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST


# ZSH Directories
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHDMINUS

unsetopt PUSHD_IGNORE_DUPS


# ZSH Completions
setopt AUTO_MENU
setopt ALWAYS_TO_END
setopt COMPLETE_IN_WORD

unsetopt FLOW_CONTROL
unsetopt MENU_COMPLETE

zmodload 'zsh/pcre'

zmodload 'zsh/zle'
zmodload 'zsh/zpty'
zmodload 'zsh/zutil'
