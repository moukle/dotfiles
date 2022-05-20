# CD on exit for fff
function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end

# mkdir and cd afterwards
function mkc; mkdir $argv && cd $argv; end

# ddnet
function ddn
    $HOME/.x/xrandr.sh game
    # setxkbmap de nodeadkeys
    eww kill
    DDNet
    $HOME/.x/xrandr.sh
    # $HOME/.x/keyboard.sh
    eww open bar
end
