# The perfect setup

## Homebrew & apps
### 1. Install Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
### 2. Install apps via homebrew
`cd` into this directory on your mac where the `Brewfile` is located. Now run `brew bundle` to install all fils

```sh
cd ~/Code/mac-setup && brew bundle
```

### 3. Backup apps via homebrew
To create a bundle file run `brew bundle dump`. However `casks` are not added. It is better to edit the [`Brewfile`](./Brewfile) by hand.

## Zsh
### Use homebrew zsh

Add the homebrew zsh `/usr/local/bin/zsh` to `/etc/shells`

```
# edit /etc/shells
sudo nano /etc/shells
# add /usr/local/bin/zsh at the end of the file
```

Verify it by running `cat /etc/shells`
```
cat /etc/shells
/bin/bash
/bin/csh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/zsh
```

To change the shell assinged to your user account, run the following command.
```
# change the default shell
chsh -s /usr/local/bin/zsh
```

### Install prezto
Remove the `.zshrc` file to avoide prezto from choking.
```shell
rm -f ~/.zshrc
```

Clone prezto (sadly there is no uncomplicated way to do this)
```shell
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

#### RUN THE COMMAND
RUN the following command to install all files for prezto & change the default shell to zsh
```shell
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s $(which zsh)
```
### Configure prezto
You can change the configuration in the `~/.zpreztorc` file.

#### Change the theme to pure
Find the theme section:
```
zstyle ':prezto:module:prompt' theme 'sorin'
```
and replace the theme with 'pure'
```
zstyle ':prezto:module:prompt' theme 'pure'
```
#### Add some modules
Find the module section:
```
zstyle ':prezto:load' pmodule \
```
and add the following to the end of it
- `node` - [npm auto-completion](https://github.com/sorin-ionescu/prezto/tree/master/modules/node)
- `autosuggestions` – [autosuggestions]( https://github.com/sorin-ionescu/prezto/tree/master/modules/autosuggestions)
You should end up with:
```
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'node' \
  'autosuggestions' \
  'prompt'
```

### Install aliases
Source alias file in source `~/.zshrc`, add the follwing lines to `~/.zshrc` by running `code ~/.zshrc`

```
## loads zshalias file to add new functions and aliases
# update path_zshalias to point to the zshalias in this folder
path_zshalias="${ZDOTDIR:-$HOME}/Repos/mac-setup/zshalias"
if [ -f $path_zshalias ]; then
    source $path_zshalias
else
    echo -e "\e[31;1m404: ${path_zshalias} not found.\e[0m"
fi
```

### Disable zsh autocorrect prompt
Add the following lines to `~/.zshrc` to disable zsh from prompting auto corrections.
```
# disable autocorrect in zsh
unsetopt correct_all
unsetopt correct
```

### Add git auto-completion
To e.g. have branch autocompletion first download the git-completion files via `curl`.

You need the original bash file in `~/.git-completion.bash` and the zsh file in `~/.zsh/git-completion.zsh`.

```
curl -o ~/.zsh/git-completion.zsh https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh && \
curl -o ~/.git-completion.bash https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
```

Add the follwing lines to the end of `~/.zshrc`
```
# add files in ~/.zsh to path
fpath=(~/.zsh $fpath)
```

### Show zsh & version 
Add the following line to the `~/.zshrc` file

```
echo Current zsh: $(which zsh) / $(zsh --version)
```

## Activate additional fonts
Mac OS Catalina comes with some high quality fonts that are not activated by default, an exhaustive list can be found on [support.apple.com](https://support.apple.com/en-us/HT210192). 

To activate the fonts:
- open the `FontBook` application
- switch to “All Fonts”
- Browse the font list, you will see many greyed out font families
- this is because they were deactivated or they weren’t downloaded yet. 
- right-click on a font or font family that wasn’t downloaded yet, select the  option to download the individual font or entire family

Great font families are:

### Font families:
- Canela from Commercial Type in 16 styles
- Domaine Display from Klim Type Foundry in 6 styles
- Founders Grotesk by Klim Type Foundry in 17 styles
- Graphik by Commercial Type in 18 styles
- Produkt by Commercial Type in 8 styles
- Proxima Nova by Mark Simonson Studio in 12 styles
- Publico by Commercial Type in 12 styles

### Individual display fonts:
- Sauber Script by TypeJockeys
- Quotes Caps and Quotes Script by Sudtipos

## Useful software
| Design | Code | Productivity |
| --- | --- | --- |
| Adobe Suite | Homebrew | Google Drive |
| Sketch & Abstract | iTerm 2 | Notion |
| Figma | Atom or VS Code | Spotify |
| Contrast (color contrast app) | | Slack |
| Sim Daltonism | | Franz & Signal |
| | | 1Password |
| | | Magnet |
