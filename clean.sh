#!/bin/bash

carburants=( E10 Gazole GPLc SP95 SP98 )

for fichier in ./*.xml
do
	echo $fichier
	for carburant in "${carburants[@]}"
	do
		echo $carburant
		xmllint $fichier | grep prix | awk 'BEGIN{FS="\""; OFS=";"} /'$carburant'/ { print substr($6,1,10), $8 }' >> clean_$carburant.txt
	done
done
