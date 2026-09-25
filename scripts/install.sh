#!/usr/bin/env bash
set -euo pipefail

repo=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)
if [[ -z "${HOME:-}" || "$HOME" != /* ]]; then
    printf 'HOME must be an absolute path\n' >&2
    exit 1
fi

sources=(
    "$repo/config/zsh/.zshrc"
    "$repo/config/finicky.js"
    "$repo/config/ghostty/config"
    "$repo/config/macos/DefaultKeyBinding.dict"
    "$repo/config/copilot/AGENTS.md"
)
destinations=(
    "$HOME/.zshrc"
    "$HOME/.finicky.js"
    "$HOME/.config/ghostty/config"
    "$HOME/Library/KeyBindings/DefaultKeyBinding.dict"
    "$HOME/.copilot/AGENTS.md"
)

for skill in "$repo"/config/copilot/skills/*; do
    if [[ ! -d "$skill" || -L "$skill" || ! -f "$skill/SKILL.md" ]]; then
        printf 'Invalid skill directory: %s\n' "$skill" >&2
        exit 1
    fi
    sources+=("$skill")
    destinations+=("$HOME/.copilot/skills/${skill##*/}")
done

conflict=0
for i in "${!sources[@]}"; do
    if [[ ! -f "${sources[$i]}" && ! -d "${sources[$i]}" ]]; then
        printf 'Missing source: %s\n' "${sources[$i]}" >&2
        conflict=1
    fi
    parent=$(dirname "${destinations[$i]}")
    while [[ "$parent" != "/" ]]; do
        if [[ -e "$parent" || -L "$parent" ]]; then
            if [[ ! -d "$parent" ]]; then
                printf 'Not a directory: %s\n' "$parent" >&2
                conflict=1
            fi
            break
        fi
        parent=$(dirname "$parent")
    done
    if [[ -L "${destinations[$i]}" ]]; then
        if [[ $(readlink "${destinations[$i]}") == "${sources[$i]}" ]]; then
            continue
        fi
    fi
    if [[ -e "${destinations[$i]}" || -L "${destinations[$i]}" ]]; then
        printf 'Already exists: %s (review and move it yourself before retrying)\n' "${destinations[$i]}" >&2
        conflict=1
    fi
done
if (( conflict )); then
    exit 1
fi

for i in "${!sources[@]}"; do
    if [[ -L "${destinations[$i]}" ]]; then
        printf 'Already linked: %s\n' "${destinations[$i]}"
        continue
    fi
    mkdir -p "$(dirname "${destinations[$i]}")"
    ln -s "${sources[$i]}" "${destinations[$i]}"
    printf 'Linked: %s -> %s\n' "${destinations[$i]}" "${sources[$i]}"
done
