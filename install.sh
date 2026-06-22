#!/bin/bash
# Heidi installer — downloads the `heidi` script into your PATH.
set -euo pipefail

REPO="codepurr/heidi"
BRANCH="main"
DEST="${HEIDI_PREFIX:-$HOME/.local/bin}"

mkdir -p "$DEST"
curl -fsSL "https://raw.githubusercontent.com/$REPO/$BRANCH/heidi" -o "$DEST/heidi"
chmod +x "$DEST/heidi"

printf 'Installed: %s/heidi\n' "$DEST"
case ":$PATH:" in
  *":$DEST:"*) ;;
  *) printf 'Add this to your shell profile, then restart the shell:\n  export PATH="%s:$PATH"\n' "$DEST" ;;
esac
printf 'Try: heidi -h\n'
