#!/usr/bin/env bash
set -euo pipefail

dist="https://nmap.org/dist/"
state_file="nmap-version.txt"

latest=$(
  curl -fsSL --retry 3 "$dist" |
    grep -oE 'nmap-[0-9]+(\.[0-9]+)+\.tar\.bz2' |
    sed -E 's/^nmap-//; s/\.tar\.bz2$//' |
    sort -Vu |
    tail -n 1
)

if [[ -z "$latest" ]]; then
  echo "Could not find an Nmap source archive at $dist" >&2
  exit 1
fi

previous=""
[[ -f "$state_file" ]] && previous=$(<"$state_file")

if [[ "$latest" == "$previous" ]]; then
  echo "Nmap version unchanged: $latest"
  exit 0
fi

if [[ -z "$previous" ]]; then
  echo "$latest" > "$state_file"
  echo "Recorded baseline Nmap version: $latest"
  exit 0
fi

echo "Nmap version changed: $previous -> $latest"
gh issue create \
  --title "Nmap $latest detected" \
  --body "The Nmap dist directory now contains the $latest source archive: $dist"

echo "$latest" > "$state_file"
