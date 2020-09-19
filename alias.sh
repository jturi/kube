#!/bin/bash
echo "aliases added to ~/.bash_aliases"
echo 'source ~/.bash_aliases'
> ~/.bash_aliases
alias ealias='vim ~/.bash_aliases'
alias reff='source ~/.bash_aliases'
alias k='kubectl'
alias ka='kubectl apply -f '
alias kdel='kubectl delete -f '
alias kd='kubectl describe '
alias kg='kubectl get '
alias kp='kubectl get po'
alias wa1='watch -n 1 '
alias kall='kubectl get all'
alias ks='kubectl config use-context'
alias kc='kubectl config get-contexts'
alias kn='kubectl config set-context $(kubectl config current-context) --namespace'
alias screen1='screen -d -r screen1 || screen -S screen1'
alias lg="ls -laFh | grep -i "
alias tmux1='tmux new -A -s tmux1'
alias th="echo 'set -g prefix C-a, copy:a[, Ctrl-Space, Alt-w, a] setw synchronize-panes, ||:a o|o, =:a \", switch:a q 1, cycle:a o, toggle:a;, move:P->, zoom:a z, towindow:a \!'"
echo 'source <(kubectl completion bash)' >> ~/.bash_aliases
echo 'complete -F __start_kubectl k' >> ~/.bash_aliases
echo 'set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab' > ~/.vimrc
echo 'export do="--dry-run -o yaml"' >> ~/.bash_aliases
echo 'export dor="--restart=Never --dry-run -o yaml"' >> ~/.bash_aliases
alias >> ~/.bash_aliases
echo export PS1=\""\033[0;32m\u \h (\\\$(kubectl config current-context)|\\\$(kubectl config view --minify --output 'jsonpath={..namespace}'))\033[0;00m \W \n\\$ "\" >> ~/.bash_aliases
