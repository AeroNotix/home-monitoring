#!/bin/sh

export SMTP_EMAIL_TO=$(</run/secrets/smtp_to)
export SMTP_EMAIL_FROM=$(</run/secrets/smtp_from)
export SMTP_SMART_HOST=$(</run/secrets/smtp_smarthost)
export SMTP_USERNAME=$(</run/secrets/smtp_username)
export SMTP_PASSWORD=$(</run/secrets/smtp_username)

cat /config/alertmanager.yml | while IFS= read -r line; do
    echo $line
done


sleep 3600
/bin/alertmanager $@
