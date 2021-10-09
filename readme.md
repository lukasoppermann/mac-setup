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
### Install prezto
Cd into this directory and run the prezto installer via the cli:

```shell
cd ~/Repos/mac-setup/ && zsh install_prezto.sh
```

Update the `path_zshconfig` in the `~/.zshrc` if needed.

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
