#!/bin/bash
#This script collects information from the user.

#Prompts user to enter api-key
read -p 'Please enter api-key: ' apikey
until [[ $apikey =~ ^[A-Z0-9a-z.-]{20,32}$ ]]
do
	echo
	echo 'Enter 20-32 characters (only lower case letters, whole numbers, "-" and "." allowed)'
	read -p 'Enter api-key: ' apikey
done
echo "api-key is: $apikey"

#Prompts user to enter latitude coordinates
read -p 'Please enter latitude coordinates: ' latitude
until [[ $latitude =~ ^-?([1-8]?[0-9]{1}\.[0-9]{1,6}|(90)\.[0]{1,6}?)$ ]]
do
	echo
	echo 'Enter latitude coordinates in real numbers, with minimum of 1 and maximum of 6 decimal places. Allowed values: -90.0 to 90.0'
	read -p 'Enter latitude coordinates: ' latitude
done
echo "Latitude is $latitude"

#Prompts user to enter longitude coordinates
read -p 'Please enter longitude coordinates: ' longitude
until [[ $longitude =~ ^-?([1]?[0-7]?[0-9]{1}\.[0-9]{1,6}|[8-9]?[0-9]{1}.[0-9]{1,6}|(180)\.[0]{1,6}?)$ ]]
do
	echo
	echo 'Enter longitude coordinates in real numbers, with minimum of 1 and maximum of 6 decimal places. Allowed values: -180.0 to 180.0'
	read -p 'Enter longitude coordinates: ' longitude
done
echo "Longitude is $longitude"

#Prompts user to enter bandwidth
read -p 'Please enter your bandwidth: ' bandwidth
until [[ $bandwidth =~ ^([0-9]*\.[0-9]{1,3}|[0-9]*)[[:space:]]?(Gbps|Mbps|Kbps)$ ]]
do
	echo
	echo 'Enter your bandwidth in real numbers, with maximum of 3 decimal places and units: Gbps, Mbps or Kbps'
	read -p 'Enter your bandwidth: ' bandwidth
done


#The following sections ensures that the output format of bandwidth in the application.properties file is number[[: space:]]units
bandwidth=`echo $bandwidth | sed 's/ //g'`

bandwidth=`echo $bandwidth | sed 's/....$/ &/'`

echo "Bandwidth is $bandwidth"

#Updates application.properties file with new values
echo -e "api-key=$apikey\nlatitude=$latitude\nlongitude=$longitude\nbandwidth=$bandwidth" > application.properties


