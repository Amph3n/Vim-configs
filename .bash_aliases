
# Custom aliases
alias gs='git status'
alias ga='git add .'

alias gcm='gitcommit'
alias gca='git commit --amend'

alias gp='git push'
alias gpf='git push --force-with-lease'

alias pull='git pull'
alias g-='git checkout -'

alias prod='git checkout prod'
alias greset='git reset --hard'

alias gsl='git stash list'
alias gsm='gitStashPushMessage'
alias gsp='gitStashPopIndex'

# Custom functions
function vue() {
  dev npm run vue
}

# Git specific functions
function gitcommit() {
  git commit -m "$*"
}

function gitStashPushMessage() {
  if [ $# -eq 0 ]; then
    read -rp "Stash message: " msg
    git stash push -m "$msg"
  else
    git stash push -m "$*"
  fi
}

function gitStashPopIndex() {
  # Get list of stashes
  mapfile -t stashes < <(git stash list)

  if [ ${#stashes[@]} -eq 0 ]; then
    echo "No stashes found."
    return 1
  fi

  echo "Available stashes:"
  for i in "${!stashes[@]}"; do
    echo "[$i] ${stashes[$i]}"
  done

  # Ask the user to choose an index
  read -rp "Enter stash index to pop: " choice

  # Validate numeric input
  if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -ge "${#stashes[@]}" ]; then
    echo "Invalid selection."
    return 1
  fi

  # Pop with --index
  git stash pop --index "stash@{$choice}"
}

# Quick navigation
function twenty() {
  cd ~/
  cd cv-developer/projects/twenty
}

function xml() {
  cd ~/
  cd cv-developer/projects/xml
}

function dune() {
  cd ~/
  cd cv-developer/projects/dune
}
