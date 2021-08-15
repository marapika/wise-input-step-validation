Simple script taking user inputs for properties file (creates file application.properties):
wise-input.sh

Script for cron job to monitor changes of the properties file (if changed creates file CHANGES.application.properties.[timestamp] with differences):
wise-cron.sh

To add script to cron, follow commands:
> crontab -e
In the file place command:
> */1 * * * * /PATH/wise-cron.sh

