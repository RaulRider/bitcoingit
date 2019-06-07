#!/bin/bash

# FUNCTION
linea()
{
	# Dibuja una linea
	echo "############################################" ;
	echo ""
}

linea_2()
{
        # Dibuja una linea
	echo ""
        echo "---------------------------------------------" ;
        echo ""
}


# MAIN

clear

selection=
until [ "$selection" = "0" ]; do
    linea
    echo "
    PROGRAM MENU

    1 - CAT  bitcoin.conf
    2 - EDIT bitcoin.conf
    3 - LIST Bitcoin data dir
    4 - RUN  bitcoin as it is
    5 - RUN  bitcoin -TESTNET
    6 - 
    7 -
    
    9 - check Bitcoin is RUNNING?
    0 - exit program
"
    linea
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) clear ; linea_2 ; cat $HOME/Library/Application\ Support/Bitcoin/bitcoin.conf ; linea_2 ;;
        2 ) clear ; nano $HOME/Library/Application\ Support/Bitcoin/bitcoin.conf ;;
        3 ) clear ; linea_2 ; ls -lha $HOME/Library/Application\ Support/Bitcoin/ ; linea_2 ;;
	4 ) clear ; linea_2 ; echo "Press to RUN Bitcoin as IT IS....." ; read ; /Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt & disown ;;
        5 ) clear ; linea_2 ; echo "Press to RUN Bitcoin as TESTNET..." ; read ; /Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt -testnet & disown;;
	6 )  ;;
        7 )  ;;
	9 ) ps -A | grep itcoin ;;
	0 ) exit ;;
	
        * ) echo "Please enter 1, 2 ....  0"
    esac
done
