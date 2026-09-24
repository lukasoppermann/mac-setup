path_zshconfig_folder="${${(%):-%x}:A:h}"

# Homebrew installs the prompt and completions under its prefix.
for brew_prefix in /opt/homebrew /usr/local; do
    if [[ -x "$brew_prefix/bin/brew" ]]; then
        eval "$("$brew_prefix/bin/brew" shellenv)"
        fpath+=("$brew_prefix/share/zsh/site-functions")
        break
    fi
done
unset brew_prefix

source "$path_zshconfig_folder/zshconfig"

# Keep interactive Node tooling independent of a previous production shell.
unset NODE_ENV

[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
