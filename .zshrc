# 1. CORE PATHS & PYENV (Must come first)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Initialize Pyenv Shims
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# 2. SHELL VISUALS (Colors & Prompt)
autoload -U colors && colors
setopt PROMPT_SUBST

parse_git_branch() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    echo " %{$fg[green]%}git:(%{$reset_color%}%{$fg[red]%}${branch}%{$reset_color%}%{$fg[green]%})%{$reset_color%}"
  fi
}

PROMPT='%{$fg[magenta]%}%~%{$reset_color%}$(parse_git_branch) %{$fg[cyan]%}%%%{$reset_color%} '

# 3. ALIASES
alias gs="git status"
alias gc="git commit -am"
alias dc="docker-compose"
alias gch="git checkout"
alias tf15="/usr/local/bin/terraform"
alias tf18="$HOME/.config/tfenv/versions/1.8.5/terraform"
alias terraform="$HOME/.config/tfenv/versions/1.12.2/terraform"