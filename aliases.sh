#!/bin/bash
echo "aliases added to ~/.bash_aliases"
echo 'source ~/.bash_aliases'
> ~/.bash_aliases
alias ref='source ~/.bash_aliases'
alias k='kubectl '
alias ka='kubectl apply -f '
alias kdel='kubectl delete -f '
alias kd='kubectl describe '
alias kev='kubectl get events --sort-by=metadata.creationTimestamp'
alias kpo='kubectl get po -A --sort-by=.metadata.creationTimestamp'
alias kall='kubectl get po,deploy,rs,svc,ingress,pvc'
alias kallw='watch kubectl get po,deploy,rs,svc,ingress,pvc'
alias kuc='kubectl config use-context'
alias kgc='kubectl config get-contexts'
alias kn='kubectl config set-context $(kubectl config current-context) --namespace'
alias screen1='screen -d -r screen1 || screen -S screen1'
alias lg="ls -laFh | grep -i "
alias lt="echo 'Showing first 10 results:' && ls -lacth  --show-control-chars -F --color | head -n 11"
alias tmux1='tmux new -A -s tmux1'
alias th="echo 'set -g prefix C-a, copy Ctrl-a [, Indent V > Ctrl-Space, Alt-w, Ctrl-a ] setw synchronize-panes, || Ctrl-a o|o, =: Ctrl-a \", switch Ctrl-a q 1, cycle Ctrl-a o, toggle: Ctrl-a ;, move:P->, zoom Ctrl-a z, towindow Ctrl-a \!'"
echo 'source <(kubectl completion bash)' >> ~/.bash_aliases
echo 'complete -F __start_kubectl k' >> ~/.bash_aliases
echo 'set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab' > ~/.vimrc
echo 'set -g prefix C-a' > ~/.tmux.conf
echo 'export do="--dry-run=client -o yaml"' >> ~/.bash_aliases
echo 'export dor="--restart=Never --dry-run=client -o yaml"' >> ~/.bash_aliases
echo 'export rn="--restart=Never"' >> ~/.bash_aliases
echo 'export KUBECONFIG=~/.kube/config' >> ~/.bash_aliases
echo 'alias grep="grep --color=auto"' >> ~/.bash_aliases
alias >> ~/.bash_aliases
echo export PS1=\""\033[0;32m\u \h (\\\$(kubectl config current-context)|\\\$(kubectl config view --minify --output 'jsonpath={..namespace}'))\033[0;00m \W \n\\$ "\" >> ~/.bash_aliases
