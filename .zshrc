export PATH="$HOME/.local/bin:$PATH"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


if command -v fastfetch &> /dev/null; then
    fastfetch
fi

eval "$(oh-my-posh init zsh)"


eval "$(oh-my-posh init zsh --config ~/henrique.omp.json)"


# Melhorar histórico
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000



## ALIAS
alias z=cd
alias g=git
alias j="cd .."
alias mk="mkdir"
alias c=clear
alias ll='ls -la --color=auto'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias dotgit='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'



alias tx=tmux
# Ativar cores no prompt
autoload -Uz colors && colors
