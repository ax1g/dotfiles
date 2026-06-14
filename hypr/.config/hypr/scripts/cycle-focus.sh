#!/usr/bin/env bash

dir="${1:-next}"

ws=$(hyprctl activewindow -j | jq -r '.workspace.id // empty')
if [[ -z "$ws" ]]; then exit 0; fi

mapfile -t clients < <(hyprctl clients -j | jq -r "
  map(select(.workspace.id == $ws and .mapped == true)) | sort_by(.address) | .[].address
")

if [[ ${#clients[@]} -le 1 ]]; then exit 0; fi

active=$(hyprctl activewindow -j | jq -r '.address')

for i in "${!clients[@]}"; do
  if [[ "${clients[$i]}" == "$active" ]]; then
    if [[ "$dir" == "prev" ]]; then
      next=$(( (i - 1 + ${#clients[@]}) % ${#clients[@]} ))
    else
      next=$(( (i + 1) % ${#clients[@]} ))
    fi
    hyprctl dispatch "hl.dsp.focus({window='address:${clients[$next]}'})"
    exit 0
  fi
done
