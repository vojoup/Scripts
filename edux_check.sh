#!/bin/bash

mail=voj.oup@gmail.com

while [ 1 ];
do

#Osetreni existence directory edux
if ! [ -d ~/edux ] 
	then 
		mkdir ~/edux
		echo "Slozka edux neexistuje. Vytvarim ji..." | ssmtp "$mail"
fi

#Osetreni exixtence souboru ~/edux_pai_old.txt
if ! [ -f ~/edux/edux_pai_old.txt ]
	then 
		curl -s "https://edux.fit.cvut.cz/courses/BI-PAI/" > ~/edux/edux_pai_old.txt
		echo "Soubor ~/edux_pai_old.txt neexistuje. Vytvarim ho..." | ssmtp "$mail" 
		
fi

#Nacte novou podobu stranky do souboru v /tmp
	curl -s "https://edux.fit.cvut.cz/courses/BI-PAI/" > /tmp/edux_pai_new.txt
	
#Porovna se starou verzi stranky
	differ="$(diff -q /tmp/edux_pai_new.txt ~/edux/edux_pai_old.txt)"

#Pokud se verze lisi posle mail a aktualizuje soubor predmetu ~/edux_pai_old.txt. Jinak ceka 10 minut
if ! [ -n "$differ" ]
	then
		cat /tmp/edux_pai_new.txt > ~/edux/edux_pai_old.txt
		echo "Stranka predmetu BI-PAI na eduxu byla updatovana !" | ssmtp "$mail"
		exit 0
	else	
		sleep 600
fi 
done
