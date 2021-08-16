This project is an exercise in scripting, validating input fields with regex and preparing script comparing changes in the file for the use in the cron.

Script taking user inputs (creates file application.properties with user inputs):
wise-input.sh

Script for cron job to monitor changes of the application.properties file (if changed, creates file CHANGES_application.properties.[timestamp] with differences):
wise-cron.sh

To add script to cron:
> crontab -e

In the file place command (cron job will run every minute):
> */1 * * * * /PATHtoTHEfile/wise-cron.sh

