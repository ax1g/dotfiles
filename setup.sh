#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo ":: Stowing dotfiles from $DOTFILES"

cd "$DOTFILES"

for pkg in hypr waybar nvim alacritty rofi fuzzel btop bottom fontconfig bash git wallpapers; do
  echo "  -> stow $pkg"
  stow "$pkg"
done

echo ":: Done! All configs linked."
