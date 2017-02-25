#!/bin/bash

ifstat=/usr/local/bin/ifstat

NETSPEEDS() {
    # wifi
    speeds=`$ifstat -i en0 -z -q 1 1 | tail -n 1`
    in=`echo $speeds | awk '{print $1}'`
    out=`echo $speeds | awk '{print $2}'`

    # ethernet
    if [ $in == "0.00" ] && [ $out == "0.00" ]; then
        speeds=`$ifstat -i en5 -z -q 1 1 | tail -n 1`
        in=`echo $speeds | awk '{print $1}'`
        out=`echo $speeds | awk '{print $2}'`
    fi

    # wifi 0 but no ethernet
    if [ $in == "n/a" ] && [ $out == "n/a" ]; then
        speeds=`$ifstat -i en0 -z -q 1 1 | tail -n 1`
        in=`echo $speeds | awk '{print $1}'`
        out=`echo $speeds | awk '{print $2}'`
    fi

    # echo -n "↓ $in ↑ $out"
    echo -n "$in $out"
}

mydate() {
    echo "$(date +"%b %d")"
}

mytime() {
    echo "$(date +"%l:%M %p")"
}

DOCKER() {
    docker=/usr/local/bin/docker
    count=`$docker ps | tail -n +2 | wc -l | awk {'print $1'}`
    icon='<i style="color: #469FD3;" class="fa fa-docker"></i>'

    echo -n "$count"

    # if [ "$count" -eq "0" ]; then
    #     echo -n ''
    # else
    #     # echo -n "🐳 $count"
    #     # echo -n "$icon $count"
    #     echo -n "$count"
    # fi
}

BATTERY() {
    battery=`pmset -g batt | egrep '([0-9]+\%).*' -o | cut -d";" -f1`

    echo $battery
}

CPU() {
    echo `ps -A -o %cpu | awk '{s+=$1} END {print s "%"}'`
}


printf '{"docker":"%s", "netspeeds":"%s", "date":"%s", "time":"%s", "battery":"%s", "cpu":"%s"}' "$(DOCKER)" "$(NETSPEEDS)" "$(mydate)" "$(mytime)" "$(BATTERY)" "$(CPU)"


