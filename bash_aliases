# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lFh'
alias la='ls -Alh'
alias l='ls -CF'
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls

alias free='free -m'

alias tree='tree -Csu'     # nice alternative to 'recursive ls'
alias pg='ps waux | grep -i'
alias mkdir='mkdir -p'
alias more='less'
alias watch='watch -n 1'
alias xg='cd ~/git/xdcc-grabscher/trunk; screen -S xdcc-grabscher ./XG.Server.Cmd/bin/Release/XG.Server.Cmd.exe'
alias proxy='screen -S proxyspence ssh -N -L 3333:localhost:3128 spence'
alias packagelist='dpkg --get-selections | /bin/grep -v deinstall$ | /bin/grep install$ | /usr/bin/awk '"'"'{print $1}'"'"' > full.package.list-$(/bin/uname -n)'
alias packageinstall='sudo aptitude install $(cat full.package.list-$(/bin/uname -n))'
alias nmap-manual='HOST=127.0.0.1;for((port=1;port<=65535;++port)); do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep "Connected to" > /dev/null; then echo -en "\n\nport $port/tcp is open\n\n";fi;done | grep open'
alias minecraft='java -Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=3333 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=3333 -Xmx800m -jar ~/opt/minecraft/minecraft.jar'

