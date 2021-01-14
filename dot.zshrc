# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker python kubectl osx zsh-autosuggestions kube-ps1)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR=nano


# Set personal aliases
alias gr='gvim --remote'
alias vr='vimr $(fzf)'
alias or='open $(fzf)'
alias goto='cd $(dirname `fzf`)'
alias D="cd $HOME/Downloads"
alias W="cd $HOME/Dropbox/wiki"
alias w="cd $HOME/wise2c"
alias V="[ -d ./venv ] && . ./venv/bin/activate"
alias Z=". $HOME/.zshrc"
alias ts='tig status'
alias h='history'
alias vi='nvim'
alias kc='kubectl'
alias kcc='k9s -n wisecloud-controller'
alias kca='k9s -n wisecloud-agent'
alias kcd='kubectl delete'
alias kcds='kubectl describe'
alias kca='kubectl apply'
alias kcg='kubectl get'
alias kgp='kubectl get pod'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kge='kubectl get events'
alias cat=bat
alias http=curlie
alias glr='git pull --rebase'
alias ls=exa
alias lt='\ls -lt | head'
alias wget=aria2c

function ipa {
	ifconfig  en0 | grep 'inet ' | awk '{print $2}'
}

function fan
{
	export http_proxy=http://localhost:7890
	export https_proxy=http://localhost:7890
	export HTTP_PROXY=http://localhost:7890
	export all_proxy=socks5://127.0.0.1:7891
	export __FAN_PROMPT=$PS1
	export PS1="${PS1}_> "
	# git config --global http.proxy localhost:2080
}

function unfan
{
	if [ -z $__FAN_PROMPT ]; then
		return
	fi
	unset http_proxy
	unset https_proxy
	unset HTTP_PROXY
	unset all_proxy
	export PS1=$__FAN_PROMPT
	unset __FAN_PROMPT
}

function path {
    echo $PATH | sed -e 's,:,\
,g'
}

function wisegit
{
    git config --local user.name "Wenzhi Liang"
    git config --local user.email "liangwz@wise2c.com"
}

function ktx
{
    pushd .
    cd $HOME/.kube
    git checkout $(git branch | fzf)
    popd
}

function update_ctx
{
	cd ~/wseyun/wise2c-kubectl
	git pull && rm -rf ~/.kube/configs/* && cp conf/* ~/.kube/configs/ && chmod 600 ~/.kube/configs/*
}

function K
{
	ctx=$(ls ~/.kube/configs | fzf)
	export KUBECONFIG=$HOME/.kube/configs/$ctx
}

function J
{
    open https://jira.wise2c.com/browse/YUN-$1
}

function backup-ymy
{
    rsync -av --delete $HOME/ymy /Volumes/Extreme\ SSD/Backup
}

function backup-wise2c
{
    rsync -av --delete $HOME/wise2c /Volumes/Extreme\ SSD/Backup
}

function jtd
{
	jira list -q "resolution = Unresolved AND assignee = $1 AND project = 10206"
}

function S
{
	vimr $(rg -l $1 | fzf)
}

function qie 
{
	 pira switch $(pira show prs | grep '^[1-9]' | fzf | sed -E 's/^([0-9]+)(.*)$/\1/' )
}


export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin
#export QINGCLOUD_KEY=$HOME/.ssh/qingcloud/qing-cloud-zoom1-key
export IMGPREFIX=registry.cn-hangzhou.aliyuncs.com/wisecloud-image
export QINGCLOUD_CACHE=qdeploy.wise2c.com:1086

ulimit -c unlimited

### gopath
export GOPATH=$HOME/go

. /usr/local/etc/autojump.sh


export NC='wisecloud-controller'
export NA='wisecloud-agent'

# kubernetes prompt
source $HOME/github/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
export NVIM_LISTEN_ADDRESS=/tmp/nvim

source /Users/wliang/.gvm/scripts/gvm
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; PATH="$GOPATH/bin:$PATH";

# Wasmer
export WASMER_DIR="/Users/wliang/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT
KUBE_PS1_PREFIX=""
KUBE_PS1_SYMBOL_DEFAULT=""
KUBE_PS1_DIVIDER="-"
KUBE_PS1_SUFFIX=" "
function change_config() { name=$(ls ~/.kube/conf | fzf); export KUBECONFIG=~/.kube/conf/${name} }

# use rigpreg with fzf for better performance
export FZF_DEFAULT_COMMAND='rg --files --hidden'

export PATH="/Users/wliang/.linkerd2/bin":"/Users/wliang/.cargo/bin":$PATH

export GO111MODULE=on 
export HELM_EXPERIMENTAL_OCI=1
