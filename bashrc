# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=20000
HISTTIMEFORMAT="[%Y-%m-%d - %H:%M:%S] "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    if [ $(whoami) != "root" ] ; then
      PS1='${debian_chroot:+($debian_chroot)}\[\033[1;36m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h\[\033[32m\]:\w\[\033[0;35m\]\[\033[00m\]\$ '
      if [ -f /usr/share/git/completion/git-prompt.sh ]; then
        . /usr/share/git/completion/git-prompt.sh
      fi
      if type __git_ps1 >/dev/null 2>&1; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[1;36m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h\[\033[32m\]:\w\[\033[0;35m\]$(__git_ps1 "[%s]")\[\033[00m\]\$ '
      fi
    else
      # root prompt
      PS1='${debian_chroot:+($debian_chroot)}\[\033[1;31m\]\u\[\033[1;32m\]@\[\033[1;33m\]\h\[\033[32m\]:\w\[\033[00m\]\$ '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


function xtitle()      # Adds some text in the terminal frame.
{
    case "$TERM" in
        *term | rxvt)
            echo -n -e "\033]0;$*\007" ;;
        *)  
            ;;
    esac
}

# aliases that use xtitle
alias top='xtitle Processes on `hostname` && top'
alias htop='xtitle Processes on `hostname` && htop'
alias make='xtitle Making $(basename $PWD) ; make'
alias ncftp="xtitle ncFTP ; ncftp"

# .. and functions
#function man()
#{
#    for i ; do
#        xtitle The $(basename $1|tr -d .[:digit:]) manual
#        command man -a "$i"
#    done
#}


function swap()  # Swap 2 filenames around, if they exist
{                #(from Uzi's bashrc).
    local TMPFILE=tmp.$$ 

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE 
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c='bsdtar xvf';;
            *.7z)  c='7z x';;
            *.Z)   c='uncompress';;
            *.bz2) c='bunzip2';;
            *.exe) c='cabextract';;
            *.gz)  c='gunzip';;
            *.rar) c='unrar x';;
            *.xz)  c='unxz';;
            *.zip) c='unzip';;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command $c "$i"
        e=$?
    done

    return $e
}


#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------

function repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}





#-------------------------------------------------------------
# Greeting, motd etc...
#-------------------------------------------------------------

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'              # No Color


# Looks best on a terminal with black background.....
echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}\
${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"
date
fortunemod=`which fortune 2>/dev/null`
cowthinkbin=`which cowthink 2>/dev/null`
if [[ (-x $fortunemod) && (-x $cowthinkbin) ]]; then
    $fortunemod -s | $cowthinkbin    # Makes our day a bit more fun.... :-)
fi
# list screen sessions
if which screen >/dev/null 2>&1; then
    screen -q -ls
    if [ $? -ge 10 ]; then
        screen -ls
    fi
fi


function _exit()        # Function to run upon exit of shell.
{
    echo -e "${RED}Hasta la vista, baby.${NC}"
}
trap _exit EXIT


#apt history
function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

random_mac() {
  printf '%02x' $((0x$(od /dev/urandom -N1 -t x1 -An | cut -c 2-) & 0xFE | 0x02)); od /dev/urandom -N5 -t x1 -An | sed 's/ /:/g'
}

gen-monkey-pass() {
    [[ $(echo "$1"|grep -E '[0-9]+') ]] && NUM="$1" || NUM=1
    for I in $(seq 1 "$NUM"); do
        LC_CTYPE=C strings /dev/urandom|grep -o '[a-hjkmnp-z2-9-]'|head -n 16|paste -sd '' -
    done | column
}
gen-xkcd-pass() {
    [[ $(echo "$1"|grep -E '[0-9]+') ]] && NUM="$1" || NUM=1
    DICT=$(LC_CTYPE=C grep -E '^[a-Z]{3,6}$' /usr/share/dict/words)
    for I in $(seq 1 "$NUM"); do
        WORDS=$(echo $DICT|shuf -n 6|paste -sd ' ' -)
        XKCD=$(echo -n "$WORDS"|sed 's/ //g')
        echo "$XKCD ($WORDS)"|awk '{x=$1; $1=""; printf "%-36s %s\n", x, $0}'
    done | column
}

if [ -d ~/bin/ ]; then
  PATH=$PATH:$HOME/bin
fi

if [ -d ~/go ]; then
  GOPATH=~/go
  PATH=$PATH:$HOME/go/bin
fi

if [ -d ~/opt/adt-bundle ]; then
  export PATH=${PATH}:~/opt/adt-bundle/sdk/platform-tools:~/opt/adt-bundle/sdk/tools
fi

export EDITOR="vim"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.bash_aliases_more ]; then
    . ~/.bash_aliases_more
fi

if [ -f ~/bin/sbm.sh ]; then
    . ~/bin/sbm.sh
fi

if [ -d ~/.bash_completion.d ]; then
  for baco in ~/.bash_completion.d/*.bash ; do
    . $baco
  done
fi

export http_proxy=10.0.2.2:3128
export https_proxy=10.0.2.2:3128
export ftp_proxy=10.0.2.2:3128
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export FTP_PROXY=$ftp_proxy
