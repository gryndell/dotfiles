if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $HOME/bin $HOME/.local/bin $PATH

if test -e $HOME/.gem/ruby/2.7.0/bin
  fish_add_path -p $HOME/.gem/ruby/2.7.0/bin
end

if test -e $HOME/.cargo/bin
  fish_add_path -p $HOME/.cargo/bin
end

if test -e $HOME/node_modules/.bin
  fish_add_path -p $HOME/node_modules/.bin
end

if test -e $HOME/go/bin
  fish_add_path -p $HOME/go/bin
end

set -x GOPATH "$HOME/go"

if test -e $HOME/lua-language-server
  fish_add_path -p $HOME/lua-language-server/bin
end

if test -e $HOME/.opam/default/bin
  fish_add_path -p $HOME/.opam/default/bin
end

set -x NODE_PATH $HOME/node_modules $NODE_PATH

# Alias vi/vim
alias vi "nvim"
alias vim "nvim"
alias vimdiff "nvim -d"

# Alias modern equivalents
alias docker "podman"
alias ll "exa -alh"
alias tree "exa --tree"

# Some cd aliases
alias .. "cd .."
alias cd.. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

# Safe cp, mv, rm
alias rm "trash-put"

# Show progress when copying large files
alias cpv "rsync -ah --info=progress2"

# When using /usr/bin/indent, use K&R style, but do not use tabs
alias indent "indent --k-and-r-style --indent-level4 --no-tabs"

# Use clang for compiling, rather than gcc
alias cc "clang"

# Simulate bash's last_history_item
function last_history_item
  echo $history[1]
end
abbr --add !! --position anywhere --function last_history_item

# Edit md and txt files with nvim
function nvim_edit
    echo nvim $argv
end
abbr --add nvim_edit --position command --regex ".+\.(md|txt)" --function nvim_edit

# Run fuzzy search and edit in tmux
abbr --add vv /home/ralph/bin/vv.sh

# Emulate MACOS pbcppy and pbpaste
alias pbcopy "xsel --input --clipboard"
alias pbpaste "xsel --output --clipboard"

# Run amfora as if a native program
alias amfora "/usr/bin/distrobox enter -n archbox -- amfora $argv"

set -x ALTERNATE_EDITOR "nano"
set -x EDITOR "nvim"      # $EDITOR should open in terminal
set -x VISUAL "nvim"      # $VISUAL also nvim
set -x PAGER "less -R"    # PAGER
set -x GIT_EDITOR "nvim"  # GIT EDITOR
set -x VIMRUNTIME "/usr/share/nvim/runtime"
set -x FZF_DEFAULT_OPTS "--preview 'bat --color=always {}'"
set -x FZF_DEFAULT_COMMAND "fd --type file --color=always"
source /usr/share/fzf/shell/key-bindings.fish

fish_vi_key_bindings insert
set fish_cursor_default underscore
set fish_cursor_insert underscore

# Config for nnn
set -x NNN_OPTS "dDegHrRx"
set -x NNN_PLUG 'f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:!ristretto $nnn;z:preview-tui'
set -x NNN_SEL '/tmp/.sel'
set -x NNN_FIFO '/tmp/nnn.fifo'
set -x NNN_SSHFS 'sshfs -o follow_symlinks'     # make sshfs follow symlinks on the remote
# set -x NNN_COLORS '1234'                        # use a different colour for each context
# set -x NNN_FCOLORS 'c1e2272e006033f7c6d6abc4'   # file-specific Colors
set -x NNN_TRASH 1                              # trash (using trash-cli) instead of delete
set -x NNN_BMS 'h:~;d:~/Documents;t:~/Documents/Technical_Documents;w:~/Wallpapers'
set -x NNN_LOCKER 'cmatrix'
set -x NNN_TMPFILE '/tmp/.lastd'

function n
  # # Block nesting of nnn in subshells

  # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
  # To cd on quit only on ^G, either remove the "set -x" as in:
  #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
  # or, set -x NNN_TMPFILE after nnn invocation
  set -x NNN_TMPFILE $HOME/.config/nnn/.lastd

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  # nnn "$@"
  nnn -P z -t 600 $argv

  if test -e '$NNN_TMPFILE'
    . $NNN_TMPFILE
    rm -f "$NNN_TMPFILE" > /dev/null
  end
end

function fish_title
  echo (status current-command) ':'
  pwd
end

function fish_greeting
#  if test "$TERM" = "xterm-kitty"
#    /usr/bin/neofetch --disable title --kitty \
#    /usr/share/pixmaps/fedora-logo-sprite.svg
#  else
#    /usr/bin/neofetch --disable title
#  end
end

# Do not show the [I] to indicate vi mode input
function fish_mode_prompt
end

# starship init fish | source
eval "$(atuin init fish --disable-up-arrow)"

# opam configuration
source /home/ralph/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
