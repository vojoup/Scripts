#!/bin/bash

dil=$(cat ~/Scripts/cislo_dilu.txt)

echo "Posledni dil mel cislo $(($dil-1))"
echo "Novy dil by mel mit cislo $dil."

vyskyt=$(curl -s "http://147.32.8.168/" | grep -c "Boruto $dil")
	
if [ $vyskyt -gt 0 ] 
then 
    echo ""
	echo "$(($dil+1))" > ~/Scripts/cislo_dilu.txt	
	echo "Nejspise vysel novy dil Boruta s cislem $(($dil+1)), radsi se podivej..."
else
    echo ""
    echo "Novy dil jeste nejspis nevysel."
    echo "Jeste chvilku vydrz :)"
fi
