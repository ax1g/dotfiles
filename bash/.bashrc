#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# clear screen on cltr + l
bind -x '"\C-l": clear'

alias code='codium'
alias ff='fastfetch'
alias ls='eza'
alias cd='z'
alias cat='bat'
alias grep='grep --color=auto'
alias gemini='zen-browser https://gemini.google.com/app'
PS1='[\u@\h \W]\$ '

__first_prompt=1; PROMPT_COMMAND='[ $__first_prompt -eq 1 ] && __first_prompt=0 || printf "\n"'

eval "$(zoxide init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"
