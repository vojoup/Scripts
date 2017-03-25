#!/bin/bash

if [ -f ~/.zprava.txt ]
then
    cat ~/.zprava.txt | qrencode -o ~/.Zpravy/sms.png -s 10
    display ~/.Zpravy/sms.png
else
    echo "Neexistuji zdrojove soubory"
    exit 1;
fi
