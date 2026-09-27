# ##############################################################################
# interactive shells
# ##############################################################################
if [[ -n $PS1 ]]; then
	# ------------------------------------------------------------------------------
	# envars
	# ------------------------------------------------------------------------------
	export VISUAL=nvim
	export EDITOR="$VISUAL"
	export PAGER=less
	export KITTY_HOST_OS=$(uname)
	export SYSTEMD_PAGER=
	export RIPGREP_CONFIG_PATH=$HOME/.config/ripgreprc

	# ------------------------------------------------------------------------------
	# PATH
	# ------------------------------------------------------------------------------
	if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
	fi
	export PATH

	# ------------------------------------------------------------------------------
	# aliases
	# ------------------------------------------------------------------------------
	alias ls="ls --color=auto"
	alias gsc="git commit -S -m"

	# ------------------------------------------------------------------------------
	# mac 
	# ------------------------------------------------------------------------------
	if [[ $(uname) == "Darwin" ]]; then
	    # homebrew bin pah
		export PATH="/usr/local/sbin:$PATH"

	    # source completions
	    if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
		source "/usr/local/etc/profile.d/bash_completion.sh"
	    fi

	    # aliases
	    alias pico8="~/Applications/PICO-8.app/Contents/MacOS/pico8 -root_path $HOME/git/ungnome/pico8/carts/"

	else
	    if [[ -r "/usr/share/bash-completion/bash_completion" ]]; then
		source "/usr/share/bash-completion/bash_completion"
	    fi
	fi

	# ------------------------------------------------------------------------------
	# additional configs 
	# ------------------------------------------------------------------------------
	if [[ -d "${HOME}/.bashrc.d" ]]; then
	    for file in "${HOME}/.bashrc.d/*";
	    do source $file
	    done
	fi


	# ------------------------------------------------------------------------------
	# pompt
	# ------------------------------------------------------------------------------
	# https://wiki.archlinux.org/title/Bash/Prompt_customization#Colors
	declare -A CLRS=(
	    [reset]="\[$(tput sgr0)\]"
	    [red]="\[$(tput setaf 1)\]"
	    [green]="\[$(tput setaf 2)\]"
	    [yellow]="\[$(tput setaf 3)\]"
	    [blue]="\[$(tput setaf 4)\]"
	    [purple]="\[$(tput setaf 5)\]"
	    [cyan]="\[$(tput setaf 6)\]"
	)

	get_prompt() {
	    PS1="\n[${CLRS[green]}\u@\h${CLRS[reset]}: ${CLRS[blue]}\W${CLRS[reset]}]"

	    # git branch
	    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	    local branch_status=$(git status -s 2>/dev/null)
	    [[ -n $branch ]] && PS1+=" ${CLRS[purple]}${branch}${CLRS[reset]}"
	    [[ -n $branch_status ]] && PS1+="${CLRS[red]}(!)${CLRS[reset]}"
	    
	    # aws-vault profile
	    [[ -n $AWS_VAULT ]] && PS1+=" ${CLRS[yellow]}(aws: ${AWS_VAULT})${CLRS[reset]}"

	    # python venv
	    [[ -n $VIRTUAL_ENV_PROMPT ]] && PS1+=" ${CLRS[yellow]}(pyenv: ${VIRTUAL_ENV_PROMPT})${CLRS[reset]}"

	    PS1+="\n\$${CLRS[reset]} "
	}

	export PROMPT_COMMAND=get_prompt
fi


# ##############################################################################
# always
# ##############################################################################

# >>> mise:activate >>> managed by mise — do not edit between markers
eval "$(mise activate bash)"
# <<< mise:activate <<<
