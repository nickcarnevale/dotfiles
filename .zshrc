# CORE PATHS

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Initialize Pyenv Shims
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# TFENV
export PATH="$HOME/.tfenv/bin:$PATH"

# SHELL VISUALS
autoload -U colors && colors
setopt PROMPT_SUBST

export VIRTUAL_ENV_DISABLE_PROMPT=1

parse_virtualenv() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    local venv_name=$(basename "$VIRTUAL_ENV")
    echo "%{$fg[blue]%}(${venv_name})%{$reset_color%} "
  fi
}

parse_git_branch() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    echo " %{$fg[green]%}git:(%{$reset_color%}%{$fg[red]%}${branch}%{$reset_color%}%{$fg[green]%})%{$reset_color%}"
  fi
}

PROMPT='$(parse_virtualenv)%{$fg[magenta]%}%~%{$reset_color%}$(parse_git_branch) %{$fg[cyan]%}%%%{$reset_color%} '

# ALIASES
alias gs="git status"
alias gc="git commit -am"