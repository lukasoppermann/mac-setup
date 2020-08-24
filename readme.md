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
### iTerm2
In iTerm go to `Preferences > Profiles > General` and change the **Command** from `Login shell` to command: `/bin/zsh`

#### Use colors
Update submodules [iTerm2 Material Design](https://github.com/MartinSeeler/iterm2-material-design)
```
git submodule update --init --recursive
```

1. In iTerm2 go to `iTerm2 > Preferences > Profiles > Colors Tab`
2. Click Color Presets...
3. Click Import...
4. Select the material-design-colors.itermcolors file
5. Select the material-design-colors from Load Presets...

### Install prezto
Remove the `.zshrc` file to avoide prezto from choking.
```shell
rm -f ~/.zshrc
```

Clone prezto (sadly there is no uncomplicated way to do this)
```shell
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

Run the following command to install all files for prezto & change the default shell to zsh
```shell
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s $(which zsh)
```
### Configure prezto
  
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
path_zshalias="~/Code/mac-setup/zshalias"
if [ -f $path_zshalias ]; then
    source $path_zshalias
else
    echo -e "\e[31;1m404: ${path_zshalias} not found.\e[0m"
fi
```

### Disable zsh autocorrect prompt
Add the follwing lines to `~/.zshrc` to disable zsh from prompting auto corrections.
```
# disable autocorrect in zsh
unsetopt correct_all
unsetopt correct
```
<!-- ## BASH Installation -->

<!-- **Double-click the `install.command`** and everything should work fine. -->

<!-- It does the following:

1. Add a `setupDir` variable to the `.bash_profile` which points to this folder on your hard drive, like this:

```bash
setupDir=$HOME/Code/.bash
```

2. `sources` (loads) the `.setup_bash` file from this folder.

```bash
source $setupDir/.setup_bash
``` -->

## Adding more files
The `.setup_bash` loads all files within the same directory that have a name starting with `.bash_` so you can easily add your own aliases and settings by creating new files like `.bash_node`.

## Useful software
| Design | Code | Productivity |
| --- | --- | --- |
| Adobe Suite | Homebrew | Google Drive |
| Sketch & Abstract | iTerm 2 | ToDoist |
| Figma | Atom or VS Code | Spotify |
| Contrast (color contrast app) | | Slack |
| | | Franz & Signal |
| | | 1Password |
| | | Magnet |
