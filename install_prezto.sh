#! /bin/zsh -
# remove .zshrc & prezto
rm -rf ~/.zprezto ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
# download prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# copy files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
# set zsh as default
chsh -s $(which zsh)
# remove .zshrc again (prezots)
rm -f ~/.zshrc
# overwrite .zshrc
cp zsh/.zshrc ~/.zshrc
# remove .zpreztorc again (prezots)
rm -f ~/.zpreztorc
# overwrite .zshrc
cp zsh/.zpreztorc ~/.zpreztorc