# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
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
plugins=(git docker python kubectl vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
export EDITOR=nano

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias lt='ls -lt | head'
alias gr='gvim --remote'
alias vr='vimr $(fzf)'
alias or='open $(fzf)'
alias goto='cd $(dirname `fzf`)'
alias cr='code -r'
alias rf='rox-filer'
alias D="cd $HOME/Downloads"
alias W="cd $HOME/Dropbox/wiki"
alias w="cd $HOME/wise2c"
alias hf="cd $HOME/wise2c/hfbank"
alias V="[ -d ./venv ] && . ./venv/bin/activate"
alias Z=". $HOME/.zshrc"
alias ts='tig status'
alias h='history'
alias vi='nvim'
alias kc='kubectl'
alias kcc='kubectl create'
alias kcd='kubectl delete'
alias kcds='kubectl describe'
alias kca='kubectl apply'
alias kcg='kubectl get'
alias kgp='kubectl get pod'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias cnpm="npm --registry=https://registry.npm.taobao.org \
	--cache=$HOME/.npm/.cache/cnpm \
	--disturl=https://npm.taobao.org/dist \
	--userconfig=$HOME/.cnpmrc"
alias sen='docker run -v /var/run/docker.sock:/run/docker.sock -ti -e TERM tomastomecek/sen'
alias cat=bat
function ipa {
	ifconfig  en0 | grep 'inet ' | awk '{print $2}'
}

function fan
{
	export http_proxy=http://localhost:2080
	export https_proxy=http://localhost:2080
	export HTTP_PROXY=http://localhost:2080
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
	export PS1=$__FAN_PROMPT
	unset __FAN_PROMPT
	# git config --global --unset http.proxy
}

function path {
    echo $PATH | sed -e 's,:,\
,g'
}

function mshare
{
    sudo mount -t cifs //nas/share2 -o username=$1,password=$2,uid=1000,gid=100,rw /mnt/share/
}

function mpers
{
    sudo mount -t cifs //nas/personal -o username=$1,password=$2,uid=1000,gid=100,rw /mnt/personal
}

function nasmount
{
    if [ ! -d $HOME/nas ]; then
	echo "Missing $$HOME/nas"
	exit
    fi
    cd
    sshfs wliang@192.168.1.2:/mnt nas
}

function andsync
{
    rsync -rlvc --delete -e 'ssh -p 2222' $HOME/sync/ admin@192.168.1.6://mnt/sdcard/Download/osxsync
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

function J
{
    jira browse CLOUD-$1
}

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export QINGCLOUD_KEY=$HOME/.ssh/qingcloud/qing-cloud-zoom1-key
export QNAK=$(cat $HOME/.ssh/qiniu/ak.txt)
export QNSK=$(cat $HOME/.ssh/qiniu/sk.txt)
export QNDOMAIN="oyzp17qa8.bkt.clouddn.com"
export XING_TRACE_ON=1

# . /etc/zsh_command_not_found

ulimit -c unlimited

### gopath
export GOPATH=$HOME/go
# using official Go distribution intead of brew installation
# export GOROOT=/usr/local/go

. /usr/local/etc/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/wliang/Downloads/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/wliang/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/wliang/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/wliang/Downloads/google-cloud-sdk/completion.zsh.inc'
fi
eval $(thefuck --alias)
export NC='wisecloud-controller'
export NA='wisecloud-agent'

# kubernetes prompt
source $HOME/github/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
export NVIM_LISTEN_ADDRESS=/tmp/nvim

eval "$(jira --completion-script-zsh)"

source /Users/wliang/.gvm/scripts/gvm
