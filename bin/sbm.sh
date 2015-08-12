# SSH bookmark creator by splitbrain
# https://gist.github.com/3660698
sbm(){
    if [ $# -lt 2 ]; then
        echo "Usage: sbm <short> [<user>@]<hostname> [-p <port>]" >&2
        return 1
    fi

    short=$1
    arg=$2

    if $(echo "$arg" | grep '@' >/dev/null); then
        user=$(echo "$arg"|sed -e 's/@.*$//')
    fi

    host=$(echo "$arg"|sed -e 's/^.*@//')

    if [ "$3" == "-p" ]; then
        port=$4
    fi

    if $(grep -i "host $short" "$HOME/.ssh/config" > /dev/null); then
        echo "Alias '$short' already exists" >&2
        return 1
    fi

    if [ -z "$host" ]; then
        echo "No hostname found" >&2
        return 1
    fi

    echo >> "$HOME/.ssh/config"
    echo "host $short" >> "$HOME/.ssh/config"
    echo "  hostname $host" >> "$HOME/.ssh/config"
    [ ! -z "$user" ] && echo "  user     $user" >> "$HOME/.ssh/config"
    [ ! -z "$port" ] && echo "  port     $port" >> "$HOME/.ssh/config"

    echo "added alias '$short' for $host"
}
