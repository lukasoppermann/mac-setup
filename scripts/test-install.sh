#!/usr/bin/env bash
set -euo pipefail

repo=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)
fixture=$(mktemp -d "${TMPDIR:-/tmp}/mac-setup-test.XXXXXX")
trap 'rm -rf -- "$fixture"' EXIT

mkdir "$fixture/clean" "$fixture/conflict" "$fixture/parent"
HOME="$fixture/clean" bash "$repo/scripts/install.sh" >/dev/null
for pair in \
    "config/zsh/.zshrc:.zshrc" \
    "config/finicky.js:.finicky.js" \
    "config/ghostty/config:.config/ghostty/config" \
    "config/macos/DefaultKeyBinding.dict:Library/KeyBindings/DefaultKeyBinding.dict" \
    "config/copilot/AGENTS.md:.copilot/AGENTS.md"; do
    source_path=${pair%%:*}
    target_path=${pair#*:}
    [[ -L "$fixture/clean/$target_path" ]]
    [[ $(readlink "$fixture/clean/$target_path") == "$repo/$source_path" ]]
done
HOME="$fixture/clean" bash "$repo/scripts/install.sh" >/dev/null

printf 'original\n' >"$fixture/conflict/.zshrc"
if HOME="$fixture/conflict" bash "$repo/scripts/install.sh" >"$fixture/output" 2>&1; then
    printf 'Expected install to refuse a conflicting file\n' >&2
    exit 1
fi
[[ $(cat "$fixture/conflict/.zshrc") == original ]]
[[ ! -e "$fixture/conflict/.finicky.js" ]]
grep -q 'Already exists:' "$fixture/output"

printf 'not a directory\n' >"$fixture/parent/.config"
if HOME="$fixture/parent" bash "$repo/scripts/install.sh" >"$fixture/output" 2>&1; then
    printf 'Expected install to refuse a conflicting parent\n' >&2
    exit 1
fi
[[ ! -e "$fixture/parent/.zshrc" ]]
grep -q 'Not a directory:' "$fixture/output"
printf 'Install tests passed\n'
