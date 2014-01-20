# Show duration of cp
cpi() {
    command cp -r $1 $2 &
    #command find / &> /dev/null &
    CPPID=$!
    trap "{kill $CPPID}" INT
    echo -n '\033[s'

    while [[ ! -z $(ps -p $CPPID|grep -v 'PID TTY') ]]; do
        echo -n '\033[u'
        echo $(du -h $2/$1|tail -n 1|awk '{print $1}')
        sleep 1
    done
}

# Forward port over ssh
sshl() {
    [[ -z $2 ]] && echo "sshl <address> <local_port>"
    ssh -L ${2}:localhost:${2} $1 -N
}

# Conversion functions
######################
flv2mp3() {
    if [[ -z $2 ]]; then
        echo "flv2mp3 <video.flv> <audio.mp3>"
        return
    fi
    ffmpeg -i $1 -ac 2 -ar 44100 -ab 320 $2
}
youtube2audio () {
    linkend=`echo $1 | cut -f2 -d=`
    ending=".flv"
    # link=$linkend$ending
    # echo $link
    youtube-dl $1
    ffmpeg -b 320k -i $linkend* $2
    rm -f $link
}
jpg2avi() {
    ffmpeg -f image2 -i *.jpg $1.avi
}
wav2mp3() {
    for (( i=1; i<=$#; i++ )); do
        eval arg=\$$i
        if [ -e "$arg" ]; then
            file=`basename "$arg" .wav`
            lame -h -b 320 "$arg" "$file.mp3"
        fi
    done
}

# Repeats a command every n seconds
repeat_while() {
    local period
    period=$1; shift;
    while (true); do
        eval "$@";
        sleep $period;
    done
}

# compare the speed of two commands (loop $1 times)
comp() {
    if [[ $# -ne 3 ]] ; then return 1 ; fi
    echo -n 1
    time for ((i=0;i<$1;i++)) ; do $2 ; done >/dev/null 2>&1
    echo -n 2
    time for ((i=0;i<$1;i++)) ; do $3 ; done >/dev/null 2>&1
}

# Locate address
geoloc() {
    echo $(curl -s 'http://www.infosniper.net/index.php?ip_address=$1'|grep 'and the Hostname'|head -n 1|cut -f39 -d' '|cut -f1 -d'"')
}

# Computer information
info() {
    echo -e "${GREEN}You are logged onto:$NC $default" ; hostname
    echo -e "\n${GREEN}Additionnal information:$NC $default" ; uname -a
    echo -e "\n${GREEN}Users logged on:$NC $default" ; w -h
    echo -e "\n${GREEN}Current date:$NC $default" ; date
    echo -e "\n${GREEN}Machine stat:$NC $default" ; uptime
    echo -e "\n${GREEN}Disk space:$NC $default" ; df -h
    echo -e "\n${GREEN}Memory stats (in MB):$NC $default" ; free -m
}

# Adds a ssh-key to a server
ssh-key-authentication() {
    if [[ -z $1 ]]; then
        return
    fi
    ssh-keygen -t rsa -b 2024
    scp ~/.ssh/id_rsa.pub $1:
    ssh $1 -t 'mkdir ~/.ssh'
    ssh $1 -t 'touch ~/.ssh/authorized_keys'
    ssh $1 -t 'cat ~/id_rsa.pub >> .ssh/authorized_keys'
    ssh $1 -t 'rm ~/id_rsa.pub'
}
