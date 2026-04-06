# 1. Ruby Management
if [ -d "/opt/homebrew/opt/chruby" ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.4.1
fi

# 2. Pyenv Interactive features
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
  eval "$(pyenv virtualenv-init -)"
fi

eval "$(starship init zsh)"

export VIRTUAL_ENV_DISABLE_PROMPT=1


