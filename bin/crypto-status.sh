#!/bin/bash

ICON="#[fg=#E7E7D8,bg=#A15FA9]"
ITEM="#[fg=colour0,bg=colour7]"
RESET="#[fg=default,bg=default]"

ETHER() {
    price=`curl -s https://www.quadrigacx.com/stats/eth_cad | grep "Last trade" | cut -f2 -d'$' | cut -f1 -d'<'`

    echo -n "$ICON Ξ $ITEM $price $RESET"
}

BTC() {
    price=`curl -s https://www.quadrigacx.com/stats/btc_cad | grep "Last trade" | cut -f2 -d'$' | cut -f1 -d'<'`

    # echo -n "$ICON B $ITEM $price $RESET"
    echo -n "$ICON  $ITEM $price $RESET"
}

FLIP() {
    flip=`curl -s https://www.flippening.watch | grep 'var pct\ .*=' | cut -d= -f2 | cut -d\; -f1 | awk '{print $1}' | cut -c1-6`

    # echo -n "$ICON 🐬 $ITEM $flip $RESET"
    echo -n "$ICON % $ITEM $flip $RESET"
}

echo -n "$(ETHER) $(FLIP) $(BTC)"
