Simple script taking user inputs (creates file application.properties):
wise-input.sh

Script for cron job to monitor changes of the properties file (if changed creates file CHANGES_application.properties.[timestamp] with differences):
wise-cron.sh

To add script to cron (runs every minute), follow commands:
> crontab -e

In the file place command:
> */1 * * * * /PATH/wise-cron.sh

