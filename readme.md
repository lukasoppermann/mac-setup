# New Mac setup

This repo contains a curated Homebrew bundle and portable settings in
[`config/`](./config/) for Zsh, Finicky, Ghostty, macOS keyboard bindings, and
Copilot's global `AGENTS.md` and skills.
It does not migrate accounts, credentials, app data, Git identity, editor
settings, other AI tools, or company-managed apps.

## Install

1. Install Apple's Command Line Tools if needed (`xcode-select --install`),
   then [Homebrew](https://brew.sh/). Accept any Xcode license prompt yourself.
2. Clone this repo anywhere, then run:

   ```sh
   cd /path/to/mac-setup
   brew bundle --file Brewfile
   bash scripts/install.sh
   ```

`scripts/install.sh` links five individual files into your home directory:
`~/.zshrc`, `~/.finicky.js`, `~/.config/ghostty/config`,
`~/Library/KeyBindings/DefaultKeyBinding.dict`, and
`~/.copilot/AGENTS.md`. It also links each skill folder in
[`config/copilot/skills/`](./config/copilot/skills/) into `~/.copilot/skills/`.
Links point to the resolved checkout location, so keep the checkout in place.
The script creates missing parent directories, never replaces them, and can
be run again without changing its own links.
If **any** target already exists, it prints every conflict and makes **no**
links. Review and move your existing files yourself before retrying. In
particular, do not discard edits in an existing `~/.zshrc`, `~/.finicky.js`,
or skill folder. Unrelated installed skills remain untouched.

## Finish manually

Sign in to your apps and restore any paid licenses. Set Finicky as the
default browser in macOS, then adjust its personal Chrome profile and app
routes in [`config/finicky.js`](./config/finicky.js) if your setup differs. Work browser
profiles and work-only routing are deliberately not included.

Restart Ghostty to pick up its linked settings. Restart affected apps for
`DefaultKeyBinding.dict` to take effect. The binding maps
Control + numeric keypad period to a comma. Homebrew installs the Pure prompt
and `fnm` used by the linked Zsh configuration, with `bun` completions loaded
when available. If you have other shell setup, merge it yourself before
replacing `~/.zshrc`. The shell aliases include `pull -b` to set the current
branch's upstream before pulling. For a machine-specific CLI kept outside
this repo, put its PATH entry in `~/.zshrc.local`, which the linked shell
configuration sources when present. For example, only on a Mac with that
checkout:

```sh
[[ -d "$HOME/Repos/ok/bin" ]] && export PATH="$HOME/Repos/ok/bin:$PATH"
```

The installer does not create or link `~/.zshrc.local`.

The Copilot links include only the global `AGENTS.md` and the seven regular
skill folders present when this setup was created. The local `skill-creator`
symlink points outside `~/.copilot/skills` and is not migrated. Do not copy or
link the entire `~/.copilot` directory, which holds sessions and authentication
data. If your Copilot app settings prompt points at the global instructions,
set that pointer again on the new Mac. The former
`COPILOT_CUSTOM_INSTRUCTIONS_DIRS` export pointed at one fixed checkout and
is not needed for the linked global instructions. Git identities, editor
settings, other AI-tool configs, shortcuts, and app databases need separate
manual setup if you use them.
