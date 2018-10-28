# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
autoload -Uz compinit
compinit


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git zsh-autosuggestions)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

bindkey '^ ' autosuggest-accept

alias gt="gittower ."

docmux() {
  tmux has-session -t docflow
  if [ $? != 0 ]; then
    tmux new-session -s docflow -n 'DocFlow' -d
    tmux send-keys -t docflow 'cd ~/dev/saas-app' C-m
    tmux send-keys -t docflow 'atom .' C-m
    tmux send-keys -t docflow 'cd ~/dev/saas-app/backend' C-m
    tmux send-keys -t docflow 'mix phx.server' C-m
    tmux send-keys -t docflow 'open /Applications/Google\ Chrome.app http://localhost:4000' C-m
    

    tmux split-window -h -t docflow -p 30
    tmux send-keys -t docflow:0.1 'cd ~/dev/PSPDFKit-Web' C-m
    tmux send-keys -t docflow:0.1 'yarn' C-m
    tmux send-keys -t docflow:0.1 'yarn start' C-m

    tmux split-window -v -t docflow:0.1
    tmux send-keys -t docflow:0.2 'cd ~/dev/pssync-server' C-m
    tmux send-keys -t docflow:0.2 'gco master' C-m
    tmux send-keys -t docflow:0.2 'gl' C-m
    tmux send-keys -t docflow:0.2 'script/server' C-m

    tmux split-window -v -t docflow:0.2
    tmux send-keys -t docflow:0.3 'cd ~/dev/saas-app/frontend' C-m
  fi
  
  tmux select-pane -t docflow:0.0
  tmux attach -t docflow
}

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
