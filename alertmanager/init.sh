#!/bin/sh

export SMTP_EMAIL_TO=$(</run/secrets/smtp_to)
export SMTP_EMAIL_FROM=$(</run/secrets/smtp_from)
export SMTP_SMART_HOST=$(</run/secrets/smtp_smarthost)
export SMTP_USERNAME=$(</run/secrets/smtp_username)
export SMTP_PASSWORD=$(</run/secrets/smtp_username)

sed "s@\$SMTP_EMAIL_TO@${SMTP_EMAIL_TO}@g" /config/alertmanager.yml | \
    sed "s@\$SMTP_EMAIL_FROM@${SMTP_EMAIL_FROM}@g" | \
    sed "s@\$SMTP_SMART_HOST@${SMTP_SMART_HOST}@g" | \
    sed "s@\$SMTP_USERNAME@${SMTP_USERNAME}@g" | \
    sed "s@\$SMTP_PASSWORD@${SMTP_PASSWORD}@g" > /tmp/alertmanager.yml

cat /tmp/alertmanager.yml

sleep 3600

/bin/alertmanager $@
