# Updated: 2020/11/14
################################# ..BASH #################################
# Place this to your .bashrc file to load this .bash_aliases file:
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

################################# ..ENVS #################################
export BROWSER=$HOME/.local/bin/chrome
export SKAFFOLD_UPDATE_CHECK=false
export PGPASSFILE="$HOME/.pgpass"


################################# ..AZURE #################################
alias azas='az account show '
alias azal='az account list --all -o table '
alias azsub='az account set --subscription '
alias azloc='az account list-locations -o table'
alias azclear='az account clear'
alias aztoken='az account get-access-token'
alias azlock='az account lock '
alias azmg='az account management-group '

################################# ..GIT #################################
if [[ -x "$(command -v git)" ]]; then
# git commands for puppet
git config --global alias.track-submodule-branch  "! git submodule foreach -q --recursive 'branch=\"\$(git config -f \$toplevel/.gitmodules submodule.\$name.branch)\"; git checkout \$branch >/dev/null 2>/dev/null'"
## execute it with "git update"
git config --global alias.update "! git checkout dev && git pull && git checkout dev_turijoz && git pull && git merge dev && cd \$(git rev-parse --show-toplevel) && git submodule update && git track-submodule-branch"
fi

alias ga='git add -A'
alias gac='git add . && git commit'
alias gbr='git branch'
alias gbrall='git branch -a'
alias gc='git commit'
alias gcm='git commit -m'
alias gch='git checkout'
alias gchm='git checkout master'
alias gchj='git checkout jarvis-dev'
alias gcl='git clone'
alias gclean='git clean -fdx'
alias gunstage='git rm --cached -rf .'
alias guser='git shortlog -s -n --all --no-merges'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch -v && git status'
alias ghead='git checkout -B master HEAD'
alias gi='git add --interactive'
alias gl="git log --pretty='%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s' -20"
alias glall='git log --oneline --all --graph --decorate'
alias gpop='git stash pop'
alias gmerge='git checkout master && git pull && git merge develop && git push && git checkout develop'
alias gpull='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias gpullf='git reset --hard HEAD && git clean -fdx && git pull origin `git rev-parse --abbrev-ref HEAD`'
alias gpush='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gtrack='git branch --set-upstream-to=origin/`git rev-parse --abbrev-ref HEAD`'
alias grhard='git reset HEAD^ --hard'
alias grsoft='git reset HEAD^ --soft'
alias gs='git status -s'
alias gsort='git log HEAD --pretty="/invert:%h" --name-only | grep -v -E \
"^\/invert:|^$" | sort -u | while read path; \
do echo $(git log -1 --pretty="%ad %h" --date=format:"%Y-%m-%d %H:%M:%S" -- "$path") $path;done | sort -u'
alias gshow='git fetch --all && git remote show origin'
alias gst='git status'
alias gstash='git stash'
alias getsshkey='cat ~/.ssh/id_rsa.pub | xclip -sel clip \
&& echo "copied, if not run ssh-keygen -b 4096"'
alias gsize=gsize; gsize() {
git status --porcelain | sed 's/^...//;s/^"//;s/"$//' | while read path; do
    du -bs "$path" ;
done | sort -n | awk ' {tot = tot+$1; print } END { printf("%.2fMB\n",tot/(1024*1024)) }'
}

################################## ..KUBECTL ##################################
alias k='kubectl '
alias ka='kubectl apply -f '
alias kall='kubectl get po,svc,pvc,deploy'
alias kallw='watch kubectl get po,svc,pvc,deploy'
alias kgc='kubectl config get-contexts '
alias kuc='kubectl config use-context '
alias kd='kubectl describe '
alias kroles='kubectl get serviceaccount,role,rolebinding '
alias kapi="echo $(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')"

alias kdel='kubectl delete -f '
alias kg='kubectl get '
alias kns='kubectl config set-context $(kubectl config current-context)  --namespace  '
alias kpo='kubectl get pods '
alias kgn='kubectl get namespace '
alias krq='kubectl get resourcequotas'
alias ksec='kubectl get secrets,configmap'
alias ksa='kubectl get serviceaccount,role,rolebinding'
alias kcdel='kubectl config delete-context '  
alias kubels='ls -la ~/.kube/kubeconfigs '
alias kenv='echo $KUBECONFIG'
alias ktoken='cat $KUBECONFIG | grep -i "token:"'
alias kncl='kubectl config set-context $(kubectl config current-context)  --namespace  cattle-logging'
alias kncp='kubectl config set-context $(kubectl config current-context)  --namespace  cattle-prometheus'
alias kncs='kubectl config set-context $(kubectl config current-context)  --namespace  cattle-system'
alias kncm='kubectl config set-context $(kubectl config current-context)  --namespace  cluster-manager'
alias knd='kubectl config set-context $(kubectl config current-context)  --namespace  default'
alias knin='kubectl config set-context $(kubectl config current-context)  --namespace  ingress-nginx'
alias knjd='kubectl config set-context $(kubectl config current-context)  --namespace  jarvis-dev'
alias knju='kubectl config set-context $(kubectl config current-context)  --namespace  jarvis-uat'
alias knknl='kubectl config set-context $(kubectl config current-context)  --namespace  kube-node-lease'
alias knkb='kubectl config set-context $(kubectl config current-context)  --namespace  kube-public'
alias knks='kubectl config set-context $(kubectl config current-context)  --namespace  kube-system'
alias knni='kubectl config set-context $(kubectl config current-context)  --namespace  nginx-ingress'
alias knss='kubectl config set-context $(kubectl config current-context)  --namespace  security-scan'
alias knt='kubectl config set-context $(kubectl config current-context)  --namespace  trident'


export do='--dry-run -o yaml'
export b64='| base64'
export b64d='| base64 --decode'
export xc='| xclip -sel clip'
# export do='--dry-run=client -o yaml'
export dor='--restart=Never --dry-run -o yaml'
alias kauth='kubectl auth can-i --list '
alias kall='kubectl get all'
alias kbook='cat ~/.kube/kubeconfigs/cluster_bookmarks.txt'
alias kstats='kubectl version --short && kubectl get cs && kubectl get nodes && kubectl cluster-info'
alias kapi='kubectl api-versions'

# alias kcg='kubectl config get-contexts | grep -i'
# alias kuse='kubectl config use-context'

# Switch to any cluster context using grep
# Copy cluster config files to $HOME/.kube/kubeconfigs with named like:
# cluster-dn8-sp-kcapp001_BeonStable.config, cluster-dn8-sp-kcapp101_BeonTC.config etc.
# After that these scripts will find them and use them as KUBECONFIG env variable
alias ks=ks; ks() {
  grep_count=`ls $HOME/.kube/kubeconfigs | grep -i $1 | wc -l`

  if [[ $grep_count == 1 ]]; then
    config_name=`ls $HOME/.kube/kubeconfigs | grep -i $1`
    echo -e "${GREEN}Changing config to $config_name${NORMAL}"
    export KUBECONFIG=$HOME/.kube/kubeconfigs/$config_name
    echo "KUBECONFIG set: $KUBECONFIG"
  elif [[ $grep_count == 0 ]]; then
    echo -e "${RED}No matches found to: $1${NORMAL}"
  else
    echo -e "${RED}More then one matches found:${NORMAL}"
    ls $HOME/.kube/kubeconfigs | grep -i $1
  fi
}
alias ksconfig="export KUBECONFIG=$HOME/.kube/config"
################################### ..COLORS ###################################
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# palette: https://misc.flogisoft.com/bash/tip_colors_and_formatting
NORMAL='\033[1;00m'
BLUE='\033[1;34m'
CYAN='\033[0;36m'
LCYAN='\033[1;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
PURPLE='\033[1;31m'
ORANGE='\033[0;94m'
LORANGE='\033[1;33m'
GRAY='\033[0;90m'
LGRAY='\033[1;90m'


################################## ..HELM ###################################
alias helmrl='helm repo list'
alias helml='helm list -A'
alias helmadd='helm repo add bitnami https://charts.bitnami.com/bitnami'
alias helminstall='helm install my-redis bitnami/redis --version 10.7.16 --namespace redi'
################################## ..COLORS ###################################

################################## ..LOCAL ###############################
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

################################## ..MISC ##################################
alias refp='source ~/.bash_profile'
alias refrc='source ~/.bashrc'
alias reff=reff; reff () {
  start=`date +%s`
  chmod 600 $HOME/.bash_aliases $HOME/.bashrc
  source $HOME/.bash_aliases
  source $HOME/.bashrc
  end=`date +%s`
  runtime=$((end-start))
  cat $HOME/.bash_aliases | head -n 1
  echo "aliases refreshed in $runtime seconds."
}
alias refc=refc; refc () {
  export KUBECONFIG=$(for F in ~/.kube/kubeconfigs/*.config; do echo -n "$F:"; done)
  kubectl config view --flatten > ~/.kube/config
  export KUBECONFIG=$HOME/.kube/config
  echo -e ".kube/config refreshed"
}
alias refs=refs; refs () {
screen_session_name=$1
if [[ -n "$screen_session_name" ]] ;then
  echo "screen_session_name: $screen_session_name"
else
  screen_session_name="screen1"
fi
echo "screen_session_name: $screen_session_name"
screen -Q windows | sed 's/[^0-9]*/\n/g; s/^\n//g' \
| while read; do
    screen -S $screen_session_name -p $REPLY -X stuff "clear && source ~/.bash_aliases && echo -e 'bashrc, bash_aliases refresed';"$'\n'
  done
}
alias ahk='/mnt/c/Users/turijoz/scoop/apps/autohotkey/current/AutoHotkeyU64.exe ~/my_hotkeys.ahk'
alias escreen='vi ~/.screenrc'
alias essh='sudo vim /etc/ssh_config'
alias fixbash='chmod 600 $HOME/.bash_aliases $HOME/.bashrc'
alias ealias='vim $HOME/.bash_aliases'
alias egit='vim ./.git/config'
alias vagrant='vagrant.exe '
alias ekube='vim $HOME/.kube/config'
alias eresolv='sudo vim /etc/resolv.conf'
alias edocker='vim $HOME/.docker/config.json'
alias ejarvis='vim $HOME/.kube/jarvis_secrets.yaml'
alias relog='sudo su $USER'
alias upd='sudo apt-get update'
alias aptl='apt-mark showmanual'
alias aptg='apt-mark showmanual | grep-i '
alias aptauto='sudo apt autoremove'
alias updu='sudo apt-get update && sudo apt-get upgrade'
alias krew='kubectl-krew'
alias xcc="sudo su - x_cc"
alias sshwho="ss | grep ssh"
alias sshcopy='cat $HOME/.ssh/id_rsa.pub | xclip -sel clip'
# alias sk='skaffold'
alias tri='tridentctl '
alias ste='stern . -t --since 30m'
# alias ar='argocd'


################################# ..DOCKER #################################

if [[ $HOSTNAME == "BDUWLP549" ]]; then
  export DOCKER_HOST=""
  export DISPLAY=localhost:0.0
fi

alias dco='docker-compose'
alias dcbu='docker-compose build && docker-compose up'
alias doclean='docker rm $(docker ps -a -f status=exited -q)'
alias dosudo='sudo usermod -aG docker $USER'
alias doprune='docker system prune'
alias doi='docker images'
alias dois='docker images --format "{{.ID}}\t{{.Size}}\t{{.Repository}}:{{.Tag}}" | sort -k 2 -h'
alias dops='docker ps'
alias dodf='docker system df'
alias dotest='docker search ubuntu'
alias dohi=func_dohi
func_dohi () {
  docker history --no-trunc "$1" | tac | tr -s ' ' | cut -d " " -f 5- | sed 's,^/bin/sh -c #(nop) ,,g' | sed 's,^/bin/sh -c,RUN,g' | sed 's, && ,\n  & ,g' | sed 's,\s*[0-9]*[\.]*[0-9]*[kMG]*B\s*$,,g' | head -n -1
  }
alias dohis='docker run -v /var/run/docker.sock:/var/run/docker.sock --rm $*'

################################# ..FILESYSTEM #################################
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;35:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
alias ll="ls -laFh  --show-control-chars -F --color "
alias lg="ls -laFh  --show-control-chars -F --color | grep -i "
alias aliasg="alias | grep -i "
alias la="ls -Ah  --show-control-chars -F --color "
alias lt="echo 'Showing first 10 results:' && ls -lacth  --show-control-chars -F --color | head -n 11"
alias lsn="stat -c '%a %A %U %G %s %n' *"

################################### ..EXTRACT ###################################
extract () {
  if [[ -f $1 ]] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

################################# ..DIRECTORIES #################################
alias kube='cd ~/.kube'
alias kubek='cd ~/.kube/kubeconfigs'
alias tmp='cd /tmp'
alias venvs='cd ~/venvs'
alias dow='cd ~/Downloads'
alias logs='cd ~/logs'
alias pwdc="pwd | tr -d '\n' | xclip -sel clip"

alias dua='du -sch .[!.]* * |sort -h' # list files/folders by size
alias duat='du -sch .[!.]* * |sort -d > total_space' # list files/folders by size /var/lib/docker
alias cd..='cd ..'
alias cd~='cd ~'

################################# ..SCREEN, TMUX #################################
alias screen1='screen -d -r screen1 || screen -S screen1'
alias screen2='screen -d -r screen2 || screen -S screen2'
alias tmux1='tmux new -A -s tmux1'
alias tl='tmux ls'
alias tkill='tmux kill-session -t '

################################ ..COMPLETION ###############################
# Autocompletion for kubectl -> tab tab

if [[ -n "$BASH" ]] ;then
  # kubectl and bash completions
  if [[ -x "$(command -v kubectl)" ]]; then
      source <(kubectl completion bash)
      complete -F __start_kubectl k
  fi

  if ! shopt -oq posix; then
    if [[ -f /etc/profile.d/bash_completion.sh ]]; then
      source /etc/profile.d/bash_completion.sh
    fi
  fi

  if [[ -x "$(command -v stern)" ]]; then
      source <(stern --completion=bash)
  fi
fi

################################### ..PS1 ###################################

# Get current time to show in PS1 i.e: 11:29:02
function __get_time_ps1() {
    TIME=$(date +"%H:%M:%S")
    if [[ -n "$TIME" ]]; then
        echo "${TIME}"
    fi
    }

# Get current cluster and namespace names
function __k8s_details_ps1() {
    # Get current context and namespace if set
    if [[ -x "$(command -v kubectl)" ]] && [[ -f ~/.kube/config ]]; then
      CONTEXT=$(kubectl config current-context)
      NAMESPACE=$(kubectl config view --minify --output 'jsonpath={..namespace}')
    fi
    if [[ -n "$CONTEXT" ]]; then
        K8S_DETAILS="${CONTEXT}"
        if [[ -n "$NAMESPACE" ]]; then
        K8S_DETAILS="${CONTEXT}:${NAMESPACE}"
        fi
    fi
    if [[ -n "$K8S_DETAILS" ]]; then
        echo "${K8S_DETAILS}"
    fi
}

# Get current branch name
function __git_details_ps1() {
    # Get current git branch
    if [[ -x "$(command -v git)" ]]; then
      GIT_BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    fi
    if [[ -n "$GIT_BRANCH" ]]; then
        echo "${GIT_BRANCH}"
    fi
}

function __get_k8s_token() {
    if [[ -n "$KUBECONFIG" ]]; then
        cat $KUBECONFIG | grep -i "token:" | head -1 | tail -c 5
        # cat $KUBECONFIG | grep -i "token:" | cut -d '-' -f 3 | grep -Po "^..."
    else
      echo "_"
    fi
}

function __is_proxy_enabled() {
  # Indicate if proxy is enabled with a ! symbold
    if [[ -n "$HTTP_PROXY" ]]; then
      echo " !"
    fi
}


# Set custom PS1
# Current look:
#    time     user        hostname         current cluster   current namespace  git branch  current folder
# 15:35:22 user_name dn8-it-lchtst07 {cluster-dn8-sp-kcapp101:default} (git-branch) jarvis ▼
if [[ -n "$BASH" ]] ;then
  export PS1="${NORMAL}\$(declare -F __get_time_ps1 >/dev/null && __get_time_ps1)${RED}\$(__is_proxy_enabled) \u ${GREEN}\h${YELLOW} {\$(__get_k8s_token):\$(declare -F __k8s_details_ps1 >/dev/null && __k8s_details_ps1)}${BLUE} \$(declare -F __git_details_ps1 >/dev/null && __git_details_ps1)${CYAN} \w${NORMAL} >\n\$ "
  # export PS1="${NORMAL}${RED} \u ${GREEN}\h${YELLOW} {:}${BLUE})${CYAN} \w${NORMAL} ▼\n\$ "

fi

################################ ..INSTALL #####################################
if [[ $USEPROXY == "" ]]; then
  export USEPROXY='echo "(proxy not used)" && '
fi
## Add this to your path:
export PATH=~/bin:$PATH
### kubectl 1.18.5
alias installkubectl="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} curl -L --remote-name-all https://storage.googleapis.com/kubernetes-release/release/v1.18.5/bin/linux/amd64/kubectl && chmod 755 kubectl && cd -"
### rke 1.1.6
alias installrke="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} curl -Lo rke https://github.com/rancher/rke/releases/download/v1.1.6/rke_linux-amd64 && chmod 755 rke && cd -"
### skaffold 1.15
alias installskaffold="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/v1.15.0/skaffold-linux-amd64 && chmod +x skaffold && cd -"
### helm 3.3.4
alias installhelm="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} curl -Lo helm-v3.3.4-linux-amd64.tar.gz https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz && tar -xzvf helm-v3.3.4-linux-amd64.tar.gz && chmod +x ./linux-amd64/helm && mv ./linux-amd64/helm ${HOME}/bin/ && cd -"
### terraform 0.12.26
alias installterraform="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && curl -Lo terraform_0.12.26.zip https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip && unzip terraform_0.12.26.zip && chmod +x terraform && cd -"
### argocd 1.7.4
alias installargocd="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} curl -Lo argocd https://github.com/argoproj/argo-cd/releases/download/v1.7.4/argocd-linux-amd64 && chmod +x argocd && cd -"
### azure latest
alias installazure="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} curl -L https://aka.ms/InstallAzureCli | bash"
### trident 20.04.0
alias installtrident="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} wget https://github.com/NetApp/trident/releases/download/v20.04.0/trident-installer-20.04.0.tar.gz && tar -xf trident-installer-20.04.0.tar.gz && cd trident-installer && cp tridentctl ${HOME}/bin/"
### stern 1.11.0
alias installstern="mkdir -p ${HOME}/bin/ && cd ${HOME}/bin/ && ${USEPROXY} curl -Lo stern https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 && chmod +x stern && cd -"

###############################################################################
###############################################################################
###############################################################################


############################### ..TURIJOZ #####################################
BASE_DIR=~
if [[ -n "$BASH" ]]; then
  if [[ $HOSTNAME == "BDUWLP549" ]]; then
    BASE_DIR=$HOME
    # BASE_DIR=/c/Users/turijoz
  PROMPT_COMMAND=""
  fi
fi

if [[ "$TERM" == screen* ]]; then
  screen_set_window_title () {
    local HPWD="$PWD"
    case $HPWD in
      $HOME) HPWD="~";;
      $HOME/*) HPWD="~${HPWD#$HOME}";;
    esac
    # only last directory
    printf '\ek%s\e\\' "${HPWD/*\//}"
    # full path
    # printf '\ek%s\e\\' "$HPWD"
  }
  PROMPT_COMMAND="screen_set_window_title; $PROMPT_COMMAND"
fi


if [[ $HOSTNAME == "winx1" ]]; then
  BASE_DIR=/mnt/d
fi

alias doww="mkdir -p $BASE_DIR/Downloads && cd $BASE_DIR/Downloads"

alias rep="cd $HOME/repos"
alias sand="cd $HOME/repos/sandbox"
alias venv="cd $HOME/venv"
alias jarvis="cd $HOME/repos/jarvis"

################################# ..PYTHON #################################
alias py='python3.6'
alias pylist="ls $BASE_DIR/venv"
alias pyact="source $BASE_DIR/venv/py37/bin/activate"
alias sendb=sendb; sendb () {
   cd $BASE_DIR/repos/sandbox/fabric_sync && source $BASE_DIR/repos/sandbox/.sandbox/bin/activate  && fab a-configure-server; cd ~
}

################################## ..TMUX ###################################
alias tsave='~/.tmux/plugins/tmux-resurrect/scripts/save.sh'
alias trestore='~/.tmux/plugins/tmux-resurrect/scripts/restore.sh'
alias installtmux='sudo apt-get install git tmux; mkdir -p ~/repos && cd ~/repos; \
git clone https://github.com/samoshkin/tmux-config.git; $HOME/repos/tmux-config/install.sh'


################################### ..PATH ####################################
PATH=~/bin:~/bin/skaffold:~/bin/python3.7.8/bin:/home/linuxbrew/.linuxbrew/bin:~/.local/bin:~/.krew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/puppetlabs/bin:/c/Users/turijoz/scoop/apps/git/current/bin:/c/Users/turijoz/scoop/apps/python/current:/c/Users/turijoz/scoop/apps/make/current/bin:/c/Users/turijoz/scoop/apps/argocd/current/bin:/c/Users/turijoz/scoop/apps/curl/current/bin:C:\HashiCorp\Vagrant\bin\vagrant.exe

################################### ..POSTGRES ####################################
# systemctl status postgresql or service postgresql status
# ps --no-headers -o comm 1
# systemd - select the systemd (systemctl) tab below.
# init - select the System V Init (service) tab below.
# \l

alias pocs='sudo pg_ctlcluster 9.5 main start'
alias polist='sudo -u postgres bash -c "psql -c \"\l\""'
alias pocreatedb='sudo -u postgres bash -c "psql -c \"CREATE DATABASE jarvis_db\""'
alias potables='sudo psql -a -U postgres -p 5432 -h localhost -c "\dt" jarvis_db'
alias poshell='sudo -u postgres psql'
alias postatus='sudo service postgresql status'
alias postart='sudo service postgresql start'
alias porestart='sudo service postgresql restart'
alias postop='sudo service postgresql stop'
alias podb='sudo -u postgres bash -c "psql -c \"SHOW data_directory;\""'
alias poconfig='sudo vim /etc/postgresql/*/main/postgresql.conf'
alias pohba='sudo vim /etc/postgresql/*/main/pg_hba.conf'
alias poclusters='pg_lsclusters'
alias poexit='\q'
