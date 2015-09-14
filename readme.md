# The perfect bash setup

## Installation

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