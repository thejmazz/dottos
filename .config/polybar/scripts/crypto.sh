#!/bin/bash

response=$(curl -s https://api.bitfinex.com/v2/tickers/?symbols=tETHUSD,tIOTUSD,tEOSUSD,tBTCUSD)

ethusd=$(echo $response | jq '.[0][7]')
iotusd=$(echo $response | jq '.[1][7]')
eosusd=$(echo $response | jq '.[2][7]')
btcusd=$(echo $response | jq '.[3][7]')

echo -n "BTC: $btcusd ETH:$ethusd IOTA:$iotusd EOS:$eosusd"
