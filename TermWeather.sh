#! /bin/sh
#TermWeather by KuhakuNeko
#The ultimate shell script for weather in terminal
#city, CityNum, wsel, location, count, i, allRepMode

#To add your favourite place just edit the script array "city" and "cityS"
city[0]="Arta,Greece"
city[1]="Corfu,Greece"
city[2]="Tokyo,Japan"
#For Finger app
cityS[0]="Arta"
cityS[1]="Corfu"
cityS[2]="Tokyo"
CityNum=${#city[@]}

echo "What kind of weather report you would like to get?"
echo "1. Simple info from inxi"
echo "2. Normal Blocks from wttr"
echo "3. Analytical report from wttr"
echo "4. Meteogram from finger"
echo "5. Small report from all the favourite locations"
read wsel


if [ $wsel != 5 ]
then
	echo "And for which of the following locations you would like to get the report?"
	count=1
	for i in "${city[@]}"
	do
		echo "$count) $i"
		let count=$count+1
	done
	echo "$count) All (Small inxi and finger report)"
	read location
	let location=$location-1
fi


if [ $wsel = "1" ]
then
	inxi -xxxW ${city[$location]}
elif [ $wsel = "2" ]
then
	curl wttr.in/${city[$location]}
elif [ $wsel = "3" ]
then
	curl v2.wttr.in/${city[$location]}
elif [ $wsel = "4" ]
then
	finger ${cityS[$location]}@graph.no
else
	echo "Inxi or Finger report? (type "inxi" or "finger")"
	read allRepMode
	if [ $allRepMode = "inxi" ]
	then
		count=1
		for i in "${city[@]}"
		do
			inxi -xxxW ${city[$count]}
			let count=$count+1
		done
	else
		count=1
		for i in "${city[@]}"
		do
			finger ${cityS[$count]}@graph.no
			let count=$count+1
		done
	fi
fi