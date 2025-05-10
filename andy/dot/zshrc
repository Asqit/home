# ------------------------------------------------------ Oh-my-zsh configuration

# Remind me of OMZ updates 
zstyle ':omz:update' mode reminder


# Check for updates every 14th day
zstyle ':omz:update' frequency 14


# Agnoster is the best
ZSH_THEME="agnoster"


# home for omz
export ZSH="$HOME/.oh-my-zsh"


# Apply omz plugins, please note, that more plugins you enable, the slower the shell will be
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)


# reload omz
source $ZSH/oh-my-zsh.sh


# Styling my auto-suggestions (Bold green)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#15db68,bold"


# Try to find first suggestion from my ZSH_HISTORY
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# Disable suggestions for large files
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# ------------------------------------------------------ Aliases

# prefer neovim over all VIs
alias vi="neovim"
alias vim="neovim"

# clear & list
alias cls="clear && ls -la"

# git aliases
alias gaa="git add -A"
alias gcm="git commit -m"
alias gc="git commit"
alias gp="git pull"

# ------------------------------------------------------ Misc.
if [ -n $SSH_CONNECTION ]; then
	export EDITOR="nano"
else 
	export EDITOR="vim"
fi

# ------------------------------------------------------ Update $PATH

# Bun javascript runtime (probably successor to node.js)
BUN_PATH="$HOME/.bun"
if [ -d "$BUN_PATH" ]; then
	PATH="$BUN_PATH/bin:$PATH"
	export BUN_PATH

	# bun completion
	[ -s "/home/andrew/.bun/_bun" ] && source "/home/andrew/.bun/_bun"
fi


# my favorite javascript runtime Deno
DENO_PATH="$HOME/.deno";
if [ -d "$DENO_PATH" ]; then
	PATH="$DENO_PATH/bin:$PATH"
fi


# Adding cargo/rust support (I like rust)
CARGO_PATH="$HOME/.cargo/env"
if [ -d "$CARGO_PATH" ]; then
	source "$CARGO_PATH"
fi


# Adding Golang (as archive)
GOLANG_PATH="/opt/go/bin"
if [ -d "$GOLANG_PATH" ]; then
	PATH="$GOLANG_PATH:$PATH"
fi

export PATH
