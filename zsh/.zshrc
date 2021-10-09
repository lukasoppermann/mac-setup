# load zsh config
path_zshconfig="${ZDOTDIR:-$HOME}/Repos/mac-setup/zsh/zshconfig"
if [ -f $path_zshconfig ]; then
    source $path_zshconfig
else
    echo -e "\e[31;1m404: ${path_zshconfig} not found.\e[0m"
fi