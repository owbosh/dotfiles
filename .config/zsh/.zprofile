export PATH=$PATH:~/.local/bin

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export QT_QPA_PLATFORMTHEME=qt5ct

export BROWSER=firefox
export TERMINAL=st
export EDITOR=nvim
export VISUAL=nvim

# export GTK_USE_PORTAL=1
# export GTK_THEME=Dracula
export FZF_DEFAULT_OPTS="--height 35%"

source "$XDG_CONFIG_HOME"/lf/icons.sh
if [ ! -d /media/sda1/Media ]; then pmount /dev/sda1; fi
[ $(tty) = "/dev/tty1" ] && startx "$XDG_CONFIG_HOME"/X11/xinitrc &>/dev/null 
