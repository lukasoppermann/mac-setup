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

## BASH Installation

**Double-click the `install.command`** and everything should work fine.

It does the following:

1. Add a `setupDir` variable to the `.bash_profile` which points to this folder on your hard drive, like this:

```bash
setupDir=$HOME/Code/.bash
```

2. `sources` (loads) the `.setup_bash` file from this folder.

```bash
source $setupDir/.setup_bash
```

## Adding more files
The `.setup_bash` loads all files within the same directory that have a name starting with `.bash_` so you can easily add your own aliases and settings by creating new files like `.bash_node`.