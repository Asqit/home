# ----------------------------------------------------------------------- Misc. 

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Custom command prompt ($PS1)
PS1="┌[\e[1m\u@\w  \A\e[0m]\n\r└» "


# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi


# Use nano for ssh session and neovim for local session
if [[ -n $SSH_CONNECTION ]]; then
  EDITOR='nano'
else
  EDITOR='nvim'
fi

# ----------------------------------------------------------------------- Update $PATH

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi


# Add deno to $PATH if exists
DENO_INSTALL="$HOME/.deno"
if [ -d "$DENO_INSTALL" ]; then
	PATH="$DENO_INSTALL/bin:$PATH"
fi


# Add bun to $PATH if exists
BUN_INSTALL="$HOME/.bun"
if [ -d "$BUN_INSTALL" ]; then
	PATH="$BUN_INSTALL/bin:$PATH"
	
	# bun completions if available
	# [ -s "/home/andrew/.bun/_bun" ] && source "/home/andrew/.bun/_bun"
fi


# Source rust support if exists
CARGO_PATH="$HOME/.cargo/env"
if [ -d "$CARGO_PATH" ]; then
	. "$CARGO_PATH"


# Adding Golang (as archive)
GOLANG_PATH="/opt/go/bin"
if [ -d "$GOLANG_PATH" ]; then
	PATH="$GOLANG_PATH:$PATH"
fi


# ----------------------------------------------------------------------- Aliases

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


# ---------------------------------------------------------------------- Exports
export PATH
export EDITOR