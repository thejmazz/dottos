#!/usr/bin/env node

const { spawn } = require('child_process')

const bluetoothctl = spawn('bluetoothctl')

bluetoothctl.stdout.pipe(process.stdout)

bluetoothctl.stdin.write('info 00:18:09:66:3A:1F\n')

bluetoothctl.stdin.write('quit\n')

// # echo -e 'info 00:18:09:66:3A:1F\nquit' | bluetoothctl | grep Connected | awk '{print $2}'
// # echo -e 'info 00:18:09:66:3A:1F\nquit' | bluetoothctl
// # echo 'devices\nquit' | bluetoothctl

// # coproc bluetoothctl
// # echo -e 'info 00:18:09:66:3A:1F\nquit' >&${COPROC[1]}
// # output=$(cat <&${COPROC[0]})

// # echo -e $output
