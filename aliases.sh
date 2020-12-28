#!/bin/bash
echo "aliases added to ~/.bash_aliases, to use them run:"
echo 'source ~/.bash_aliases'

# Clear .bash_aliases file
> ~/.bash_aliases

# Shortcut to refresh .bash_aliases file
alias ref='source ~/.bash_aliases'

# kubectl shortcuts
alias k='kubectl '
alias ka='kubectl apply -f '
alias kdel='kubectl delete -f '
alias kall='kubectl get po,deploy,rs,svc,ingress,pvc'
alias kallw='watch kubectl get po,deploy,rs,svc,ingress,pvc'
alias kev='kubectl get events --sort-by=metadata.creationTimestamp'
alias kpo='kubectl get po -A --sort-by=.metadata.creationTimestamp'
echo 'export do="--dry-run=client -o yaml"' >> ~/.bash_aliases
echo 'export dor="--restart=Never --dry-run=client -o yaml"' >> ~/.bash_aliases
echo 'export rn="--restart=Never"' >> ~/.bash_aliases

# kubectl auto completion
echo 'source <(kubectl completion bash)' >> ~/.bash_aliases
echo 'complete -F __start_kubectl k' >> ~/.bash_aliases

# Set paths
echo 'export KUBECONFIG=~/.kube/config:~/.kube/config2' >> ~/.bash_aliases
echo 'export PATH=~/bin:$PATH:' >> ~/.bash_aliases

# kubectl context shortcuts
alias kgc='kubectl config get-contexts'
alias kuc='kubectl config use-context'
alias kcc='kubectl config current-context'
alias kn='kubectl config set-context $(kubectl config current-context) --namespace'

# Terminal multiplexers and navigation
echo 'alias grep="grep --color=auto"' >> ~/.bash_aliases
alias lg="ls -laFh | grep -i "
alias lt="echo 'Showing first 10 results:' && ls -lacth  --show-control-chars -F --color | head -n 11"
alias tmux1='tmux new -A -s tmux1'
alias screen1='screen -d -r screen1 || screen -S screen1'

# Vim and tmux configs
echo 'set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab' > ~/.vimrc
echo 'set -g prefix C-a' > ~/.tmux.conf

# PS1 config for kubectl curreent context and current namespace
# PS1 will look like this:
# k8s winx1 (kubernetes-admin@kubernetes|kube-system) .kube
# user host         cluster name          namespace   folder
echo export PS1=\""\033[0;32m\u \h (\\\$(kubectl config current-context)|\\\$(kubectl config view --minify --output 'jsonpath={..namespace}'))\033[0;00m \W \n\\$ "\" >> ~/.bash_aliases

# Save aliases to ~/.bash_aliases
alias >> ~/.bash_aliases


