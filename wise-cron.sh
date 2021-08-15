#!/bin/bash

#variable path to the script
folder=/home/marcin/wise-input-step-validation
#timestamp of the script execution
timestamp=$(date +"%Y%m%d_%H%M%S")


#checking if the file exists, if not, we create empty file
if [ ! -f ${folder}/previous_application.properties ]
then
	touch ${folder}/previous_application.properties

#checking if the latest file is newer than the previous version of properties
elif [ ${folder}/application.properties -nt ${folder}/previous_application.properties ]
then
	#concatenating previous and cuurrent version to capture changes. Stored in a unique file with check timestam
	cat ${folder}/previous_application.properties  > ${folder}/CHANGES_application.properties.${timestamp}
	echo "Previous user data replaced by: " >> ${folder}/CHANGES_application.properties.${timestamp}
	cat ${folder}/application.properties >> ${folder}/CHANGES_application.properties.${timestamp}

	#updating current version of file for the purpose of future changes check
	cp ${folder}/application.properties ${folder}/previous_application.properties

fi
