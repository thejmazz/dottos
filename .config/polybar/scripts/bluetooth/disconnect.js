#!/usr/bin/env node

const { spawn } = require('child_process')

const bluetoothctl = spawn('bluetoothctl')

bluetoothctl.stdout.pipe(process.stdout)

bluetoothctl.stdin.write('disconnect 00:18:09:66:3A:1F\n')

bluetoothctl.stdin.write('quit\n')
