# Sort by file size
alias lt='ls --human-readable --size -1 -S --classify'

# View only mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

# better copy
alias cpv='rsync -ah --info=progress2'

# move to thrash
alias tcn='mv --force -t ~/.local/share/Trash'

# color grep
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# gpg
alias gpg=gpg2

# python
alias python=python3

# pip
alias pip=pip3

# htop
alias top=htop

# fsize
alias fsize='du -sh'

# disk space
alias dspace='df -Bm'

# update source
alias usrc='source ~/.bashrc'

if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt update && sudo apt upgrade'
fi

## Colorize the ls output ##
alias ls='ls --color=auto'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# auto pv dir
alias mkdir='mkdir -pv'

# colordiff
alias diff='colordiff'

# root 
alias root='sudo -i'
alias su='sudo -i'

# ports
alias ports='netstat -tulanp'