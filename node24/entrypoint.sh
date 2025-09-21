#!/bin/bash
# Załaduj nvm (jeśli potrzebujesz)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Uruchom aplikację Node.js
exec "$@"
