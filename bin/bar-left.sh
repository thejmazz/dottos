# Display spaces using in a bar that accepts stdout
kwmc=/usr/local/bin/kwmc


SPACES() {
    # get active and previous space
    active=$($kwmc query space active id)
    previous=$($kwmc query space previous id)

    # get array of spaces
    spaces=()
    i=0
    while read -r line
    do
        spaces[i]="$line"
        (( i++ ))
    done <<< "$($kwmc query space list)"

    # populate bar with icons
    bar=()
    for (( i = 0; i < ${#spaces[@]}; i++ ))
    do
        if [[ ${spaces[$i]} == *"[no tag]" ]] #|| "$i" -lt 5 ]]
        then
            bar[$i]=$(($i+1))
        else
            if [[ "$i" == "9" ]]
            then
                id="${spaces[$i]:4}"
            else
                id="${spaces[$i]:3}"
            fi
            # bar[$i]="$(echo $id | tr '[:lower:]' '[:upper:]')"
            bar[$i]="$[$i+1]/$id"
        fi
    done

    # style active and previous space icons
    bbar=()
    for (( i = 0; i < ${#bar[@]}; i++ ))
    do
        if [[ $(($i+1)) == "$active" ]]
        then
            bbar[(($i*3+1))]="("${bar[$i]}")"
        else
            bbar[(($i*3+1))]=" ${bar[$i]} "
        fi
    done

    echo "${bbar[*]}"
}

windows() {
    id=`$kwmc query window focused id`
    window_list=`$kwmc query window list`

    icon_terminal='<i class="fa fa-terminal"></i>'

    echo "$window_list" | \
        sed s/Mail/'<i class="fa fa-envelope"><\/i>'/ | \
        sed s/Terminal/'<i class="fa fa-dollar"><\/i>'/ | \
        sed s/iTerm2/'<i class="fa fa-dollar"><\/i>'/ | \
        sed s/VLC/'<i class="fa fa-file-video-o"><\/i>'/ | \
        sed s/Preview,.*\.pdf.*/'<i class="fa fa-file-pdf-o"><\/>'/ | \
        # sed s/AdobeAcrobat/'<i class="fa fa-file-pdf-o"><\/>'/ | \
        # sed s/MySQLWorkbench.*/'<i class="fa fa-database"><\/>'/ | \
        sed s/Electron,.*-\ vmd.*/'vmd'/ | \
        sed s/Microsoft\ Word.*/'<i class="fa fa-file-word-o"><\/>'/ | \
        sed s/Google\ Chrome,\ Developer\ Tools.*/'<i class="fa fa-code"><\/i>'/ | \
        sed s/Google\ Chrome,\ Google\ Keep/'<i class="fa fa-sticky-note"><\/i>'/ | \
        sed s/Google\ Chrome.*YouTube.*/'<i class="fa fa-youtube-play"><\/i>'/ | \
        sed s/Google\ Chrome.*Google\ Play\ Music.*/'<i class="fa fa-music"><\/i>'/ | \
        sed s/Google\ Chrome/'<i class="fa fa-chrome"><\/i>'/ | \
        sed s/Calendar/'<i class="fa fa-calendar"><\/i>'/ | \
        sed s/MacVim/'<span class="devicons devicons-vim"><\/span>'/ | \
        sed s/Slack/'<i class="fa fa-slack"><\/i>'/ | \
        sed s/Electron,\ Messenger/'<i class="fa fa-comments"><\/i>'/ | \
        sed s/Electron,\ \([0-9]\)\ Messenger/'<i class="fa fa-comments notify"><\/i>'/ | \
        sed s/Electron,.*messaged.*/'<i class="fa fa-comments notify"><\/i>'/ | \
        sed s/Messenger/'<i class="fa fa-comments"><\/i>'/ | \
        sed -E "s/^($id), ([^,]+).*/<span class=\"active\">\2<\/span>/" | \
        # sed -E "s/^($id), ([^,]+).*/\[\2\]/" | \
        cut -d',' -f2 | sed s/^\ // | tr '\n' ' '

}

mode() {
    mode=`$kwmc query space active mode`

    # Don't show [n/m] when mode is monocle
    [ $mode == "[bsp]" ] && echo '<i class="fa fa-th-large"></i>'
    [ $mode == "[float]" ] && echo '<i class="fa fa-clone"></i>'
}

song() {
    song=`/usr/local/bin/mpc | sed '1q;d'`

    first=`echo $song | cut -d":" -f1`

    if [[ $first -ne "volume" ]]; then
        # echo $song
        echo '<i class="fa fa-music"></i>' $song
    fi
}

# echo "$(mode) $(windows) $(song)"
echo "$(mode) $(windows)"
