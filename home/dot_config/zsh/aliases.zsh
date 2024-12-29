alias c="clear"
alias e="exit"

#   - cat alternative
alias p="bat"

#   - ls alternative
alias l="lsd"
alias la="lsd --almost-all --long"

#   - find alternative
alias f="fd"

#   - vim alternative
alias v="nvim"

#   - zinit
alias zis="zinit zstatus"
alias zit="zinit times"
alias zir="zinit report --all"

#   - chezmoi
alias cz="chezmoi"
alias cza="chezmoi add"
alias cze="chezmoi edit"
alias czi="chezmoi init --apply"
alias czc="chezmoi cd"

#   - vscode
alias code="code-insiders"

#   - kubectl
alias kd="kubectl --context prd:smt2/d"
alias ka="kubectl --context prd:smt2/a"

alias hd="helm --kube-context prd:smt2/d"
alias ha="helm --kube-context prd:smt2/a"
