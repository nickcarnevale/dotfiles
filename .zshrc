eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# Enable colors and prompt substitution
autoload -U colors && colors
setopt PROMPT_SUBST

# Git branch info, with colors
parse_git_branch() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    echo " %{$fg[green]%}git:(%{$reset_color%}%{$fg[red]%}${branch}%{$reset_color%}%{$fg[green]%})%{$reset_color%}"
  fi
}

# Prompt with colored path
PROMPT='%{$fg[magenta]%}%~%{$reset_color%}$(parse_git_branch) %{$fg[cyan]%}%%%{$reset_color%} '

