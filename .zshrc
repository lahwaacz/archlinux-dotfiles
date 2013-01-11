## colors
autoload colors
colors
if [[ "$TERM" =~ ".*256color.*" && -f ~/.dircolors.256colors ]]; then
    eval $(dircolors ~/.dircolors.256colors)
elif [ -f ~/.dircolors ]; then
    eval $(dircolors ~/.dircolors)
fi

source ~/.config/zsh/opts
source ~/.config/zsh/completion
source ~/.config/zsh/prompt
source ~/.config/zsh/keybind
source ~/.config/zsh/functions
source ~/.config/zsh/aliases

## Compile zcompdump, if modified, to increase startup speed.
if [ "$HOME/.zcompdump" -nt "$HOME/.zcompdump.zwc" -o ! -e "$HOME/.zcompdump.zwc" ]; then
    zcompile "$HOME/.zcompdump"
fi


## if first argument is "eval", evaluate next arguments as shell command and don't exit
# usage: zsh -is eval 'your shell command here'
if [[ $1 == eval ]]; then
    "$@"
    set --
fi


## environment variables
export PACMAN=pacman-color  # all pacman wrappers should run pacman-color instead of pacman
export COLORFGBG=default,default,default    # I think tmux sets this wrong
