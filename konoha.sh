#!/bin/bash

dil=$(cat ~/konoha/cislo_dilu.txt)

vyskyt=$(curl -s "http://147.32.8.168/" | grep -c "Boruto $dil")
	
if [ $vyskyt -gt 0 ] 
then 
	echo "$(($dil+1))" > ~/konoha/cislo_dilu.txt	
	echo "Nejspise vysel novy dil Boruta, radsi se podivej..."
fi
