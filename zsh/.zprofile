path=(
  '/opt/local/bin'
  '/usr/local/opt/binutils/bin'
  '/usr/local/opt/ccache/libexec'
  '/usr/local/opt/curl/bin'
  '/usr/local/opt/grep/libexec/gnubin'
  '/usr/local/opt/icu4c/bin'
  '/usr/local/opt/libiconv/bin'
  '/usr/local/opt/libpq/bin'
  '/usr/local/opt/libxml2/bin'
  '/usr/local/opt/libxslt/bin'
  '/usr/local/opt/ncurses/bin'
  '/usr/local/opt/openssl/bin'
  '/usr/local/opt/openldap/bin'
  '/usr/local/opt/python/libexec/bin'
  '/usr/local/opt/ruby/bin'
  '/usr/local/opt/sqlite/bin'
  '/usr/local/opt/ssh-copy-id/bin'
  '/usr/local/opt/tcl-tk/bin'
  '/usr/local/MacGPG2/bin'
  '/usr/local/bin'
  '/usr/bin'
  '/bin'
  '/Library/Apple/usr/bin'
  '/opt/local/sbin'
  '/usr/local/opt/icu4c/sbin'
  '/usr/local/opt/openldap/sbin'
  '/usr/local/sbin'
  '/usr/sbin'
  '/sbin'
)

cpath=(
  '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk'
)

fpath=(
  '/usr/local/share/zsh/site-functions'
  '/usr/local/share/zsh/site-scripts'
  '/usr/local/share/zsh/functions'
  '/usr/local/share/zsh/scripts'
)

manpath=(
  '/usr/local/opt/coreutils/libexec/gnuman'
  '/usr/local/opt/ed/libexec/gnuman'
  '/usr/local/opt/findutils/libexec/gnuman'
  '/usr/local/opt/gawk/libexec/gnuman'
  '/usr/local/opt/gnu-indent/libexec/gnuman'
  '/usr/local/opt/gnu-sed/libexec/gnuman'
  '/usr/local/opt/gnu-tar/libexec/gnuman'
  '/usr/local/opt/gnu-which/libexec/gnuman'
  '/usr/local/opt/grep/libexec/gnuman'
  '/usr/local/opt/gsed/libexec/gnuman'
  '/usr/local/opt/make/libexec/gnuman'
  '/usr/local/opt/icu4c/share/man'
  '/usr/local/opt/ncurses/share/man'
  '/usr/local/opt/openssl/share/man'
  '/usr/local/opt/openldap/share/man'
  '/usr/local/opt/python/share/man'
  '/usr/local/opt/ruby/share/man'
  '/usr/local/opt/sqlite/share/man'
  '/usr/local/MacGPG2/share/man'
  '/usr/local/share/man'
  '/usr/share/man'
  '/Library/Apple/usr/share/man'
  "${cpath}/usr/share/man"
)

infopath=(
  '/usr/local/share/info'
  '/usr/share/info'
)

dyld_fallback_library_path=(
  '/usr/local/lib'
  '/usr/lib'
)

: << 'END'
pkg_config_path=(
  '/usr/local/opt/curl/lib/pkgconfig'
  '/usr/local/opt/icu4c/lib/pkgconfig'
  '/usr/local/opt/libpq/lib/pkgconfig'
  '/usr/local/opt/libxml2/lib/pkgconfig'
  '/usr/local/opt/libxslt/lib/pkgconfig'
  '/usr/local/opt/ncurses/lib/pkgconfig'
  '/usr/local/opt/openssl/lib/pkgconfig'
  '/usr/local/opt/python/lib/pkgconfig'
  '/usr/local/opt/readline/lib/pkgconfig'
  '/usr/local/opt/ruby/lib/pkgconfig'
  '/usr/local/opt/sqlite/lib/pkgconfig'
  '/usr/local/opt/tcl-tk/lib/pkgconfig'
  '/usr/local/opt/zlib/lib/pkgconfig'
)

ld_library_path=(
  '/usr/local/opt/openssl/lib'
  '/usr/local/MacGPG2/lib'
  '/usr/local/lib/pam'
  '/usr/local/lib/perl5'
  '/usr/local/lib/python'
  '/usr/local/lib/ruby'
)

dyld_library_path=(
  '/usr/local/lib'
  '/usr/lib'
)

dyld_fallback_library_path=(
  '/usr/local/lib'
  '/usr/lib'
)

cflags=(
  "${cflags[@]}"
)

cppflags=(
  -I'/usr/local/opt/binutils/include'
  -I'/usr/local/opt/curl/include'
  -I'/usr/local/opt/flex/include'
  -I'/usr/local/opt/icu4c/include'
  -I'/usr/local/opt/libiconv/include'
  -I'/usr/local/opt/libpq/include'
  -I'/usr/local/opt/libxml2/include'
  -I'/usr/local/opt/libxslt/include'
  -I'/usr/local/opt/ncurses/include'
  -I'/usr/local/opt/openssl/include'
  -I'/usr/local/opt/openldap/include'
  -I'/usr/local/opt/readline/include'
  -I'/usr/local/opt/ruby/include'
  -I'/usr/local/opt/sqlite/include'
  -I'/usr/local/opt/tcl-tk/include'
  -I'/usr/local/opt/zlib/include'
  -I"${cpath}/usr/include"
)

ldflags=(
  -L'/usr/local/opt/binutils/lib'
  -L'/usr/local/opt/curl/lib'
  -L'/usr/local/opt/flex/lib'
  -L'/usr/local/opt/icu4c/lib'
  -L'/usr/local/opt/libiconv/lib'
  -L'/usr/local/opt/libpq/lib'
  -L'/usr/local/opt/libxml2/lib'
  -L'/usr/local/opt/libxslt/lib'
  -L'/usr/local/opt/ncurses/lib'
  -L'/usr/local/opt/openssl/lib'
  -L'/usr/local/opt/openldap/lib'
  -L'/usr/local/opt/readline/lib'
  -L'/usr/local/opt/ruby/lib'
  -L'/usr/local/opt/sqlite/lib'
  -L'/usr/local/opt/tcl-tk/lib'
  -L'/usr/local/opt/zlib/lib'
  -L"${cpath}/usr/lib"
)
END

pythonpath=(
  '/usr/local/lib/python/site-packages'
)

node_build_definitions=(
  "${NODENV_ROOT}/plugins/node-build-update-defs/share/node-build"
  "${NODENV_ROOT}/plugins/node-build-jxcore/share/node-build"
)

rationalize() {
  local element
  local build

  build=()

  eval '
  foreach element in "$'"$1"'[@]"; do
    if [[ -d "$element" ]]; then
      build=("$build[@]" "$element")
    fi
  done
  '"$1"'=( "$build[@]" )
  '
}

for p in "${fpath[@]}"; do
  autoload -Uz "$p"/*(N:t) > /dev/null
done

if [[ -f "$HB_CNF_HANDLER" ]]; then
  source "$HB_CNF_HANDLER";
fi

if [[ -f "${CARGO_HOME}/env" ]]; then
  source "${CARGO_HOME}/env"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [[ -f "${SDKMAN_DIR}/bin/sdkman-init.sh" ]]; then
  source "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi

if [[ -d "${ANDROID_SDK_HOME}" ]]; then
  path=(
    "${ANDROID_SDK_HOME}/sdk/emulator"
    "${ANDROID_SDK_HOME}/sdk/platform-tools"
    "${path[@]}"
  )
fi

if [[ -L "${NODENV_ROOT}/bin/nodenv" ]]; then
  local bin_dir="${NODENV_ROOT}/bin"

  path=( 
    "$bin_dir"
    "${path[@]}"
  )

  eval "$( ${NODENV_ROOT}/bin/nodenv init - --no-rehash )"

  NVM_BIN="$( dirname `${NODENV_ROOT}/bin/nodenv which node` )"
fi

rationalize path
rationalize cpath
rationalize fpath
rationalize manpath
rationalize infopath

rationalize pythonhome
rationalize pythonpath

#rationalize pkg_config_path
