if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ADDONS
starship init fish | source
thefuck --alias | source
zoxide init fish | source


# PATH
set -x PATH /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /var/lib/snapd/snap/bin /home/gars/.composer/vendor/bin /home/gars/.cargo/bin /home/gars/node_modules /home/gars/.local/bin /var/lib/snapd/snap $PATH

# set main_editor to nvim
set -x EDITOR /usr/bin/nvim

# Ignore duplicate commands in the Fish shell history
function fish_preexec --description 'Remove duplicates from the Fish shell history'
  set -l cmd (commandline -b)
  if test -n "$cmd" -a "$cmd" != "$history[1]"
    history --delete $cmd
  end
end

# NNN 
set -x NNN_PLUG 'f:autojump;p:preview-tui;r:rename'
set -x NNN_FIFO /tmp/nnn.fifo
set -x NNN_FCOLORS '0:#282828;1:#cc241d;2:#98971a;3:#d79921;4:#458588;5:#b16286;6:#689d6a;7:#d65d0e;8:#af3a03;9:#fb4934;10:#b8bb26;11:#fabd2f;12:#83a598;13:#d3869b;14:#8ec07c;15:#ebdbb2'
set -x BD_COLOR '#d5c4a1'


#ALIAS
alias nv        'nvim                                             '
alias zshconf   'nv $HOME/.zshrc                                  '
alias i3conf    'nv $HOME/.config/i3/config                       '
alias picomconf 'nv $HOME/.config/picom/picom.conf                '
alias dunstconf 'nv $HOME/.config/dunst/dunstrc                   '
alias kittyconf 'nv $HOME/.config/kitty/kitty.conf                '
alias blogdir   'nv $HOME/Documents/autre/web/blog/               '
alias nvimconf  'nv $HOME/.config/nvim/init.lua                   '
alias prettier  'npx prettier --write                             '
alias roficonf  'nv $HOME/.config/rofi/                           '
alias cpySync   'sh $HOME/.config/scripts/cpySync.sh              '
alias termpdf   'python $HOME/Downloads/soft/termpdf.py/termpdf.py'
alias nnn       'nnn -e -a                                        '
alias sourcef   'source $HOME/.config/fish/config.fish            '
alias fishconf  'nv $HOME/.config/fish/config.fish                '
