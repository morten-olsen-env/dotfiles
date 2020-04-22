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
command -v _git > /dev/null && command -v complete > /dev/null && complete -o default -o nospace -F _git g

alias copy='xsel -ib'

command -v hub > /dev/null && eval "$(hub alias -s)"

alias checkrootkits="sudo rkhunter --update; sudo rkhunter --propupd; sudo rkhunter --check"
alias checkvirus="sudo freshclam && clamscan --recursive=yes --infected /home"

alias gc="git commit -m"
alias gaa="git add --all"
alias gp="git push"
alias gs="git s"
alias systemctl="sudo systemctl"
alias pacman="sudo pacman"
alias n="setsid urxvt &>/dev/null"
alias update="yay -Syu && npm upgrade -g"
alias usermount="sudo mount -o gid=users,fmask=113,dmask=002"
