# 1. Initialize Homebrew (adds brew to PATH)
# Only need this once!
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Pyenv Path Setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# 3. Initialize Pyenv Path (Ensures 'python' points to pyenv versions)
eval "$(pyenv init --path)"

# 4. Cargo/Rust (Moved from .zshenv for better organization)
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

