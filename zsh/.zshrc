path_zshconfig_folder="${ZDOTDIR:-$HOME}/Repos/mac-setup/zsh"
# to load pure prompt
fpath+=("$(brew --prefix)/share/zsh/site-functions")
# load zsh config
path_zshconfig="${path_zshconfig_folder}/zshconfig"
if [ -f $path_zshconfig ]; then
    source $path_zshconfig
else
    echo -e "\e[31;1m404: ${path_zshconfig} not found.\e[0m"
fi

# If you're not using ZSH from Homebrew (brew install zsh and $(brew --prefix)/bin/zsh), you must also add the site-functions to your fpath in $HOME/.zshrc:
