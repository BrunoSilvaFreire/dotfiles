#!/bin/bash

findExec() {

    line=$(grep -h Exec $1)
    firstLines=${line:0:3}
    
    if [ $firstLines = "Exe" ]; then
        cmd=${line:5}
    else
        cmd=${line:8}
    fi
    echo $cmd
}

start() {
    for file in $(ls -d $1/*); do
        cmd=$(findExec "$file")
        envRequirement=$(grep -h OnlyShowIn $file)
        if [ -n "$envRequirement" ]; then
            if [[ $envRequirement != i3* ]]; then
                continue
            fi
        fi
        $cmd &
        code=$?
        if [ $code = 0 ]; then
            msg="Successfully ran '$cmd'"
        else  
            msg "Execution of '$cmd' failed"
        fi
        echo $msg
        echo $msg >> $logFile
    done
    
}

logFile="$HOME/MiscProjects/dotfiles/config/i3/autostarted-programs"
echo "Start" > $logFile
start ~/.config/autostart
start /etc/xdg/autostart