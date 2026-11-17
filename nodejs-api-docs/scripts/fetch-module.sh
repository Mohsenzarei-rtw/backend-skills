#!/usr/bin/env bash
# Fetch official Node.js module documentation (markdown)
# Usage: ./fetch-module.sh <module> [version]
# Example: ./fetch-module.sh fs 24
# Default version: 24 (LTS)

set -euo pipefail

MODULE="${1:-}"
VERSION="${2:-24}"

if [[ -z "$MODULE" ]]; then
  echo "Usage: $0 <module> [version]"
  echo "Example: $0 fs 24"
  echo "Available modules: see references/modules-index.md"
  exit 1
fi

# Normalize module name (remove .html / .md if user passed them)
MODULE="${MODULE%.html}"
MODULE="${MODULE%.md}"

URL="https://nodejs.org/docs/latest-v${VERSION}.x/api/${MODULE}.md"

echo "Fetching: $URL" >&2
curl -fsSL "$URL" || {
  echo "Failed to fetch $URL" >&2
  echo "Try another version (22, 24, 26) or check the module name." >&2
  exit 1
}
