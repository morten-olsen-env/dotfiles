
#!/usr/bin/env bash

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."

alias g="git"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	if type complete &> /dev/null; then
		complete -o default -o nospace -F _git g;
	fi
fi;

alias copy='xsel -ib'

if type hub &> /dev/null; then
	eval "$(hub alias -s)"
fi

alias vim='nvim'
