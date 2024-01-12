#!/bin/sh

export SMTP_EMAIL_TO=$(</run/secrets/smtp_to)
export SMTP_EMAIL_FROM=$(</run/secrets/smtp_from)
export SMTP_SMART_HOST=$(</run/secrets/smtp_smarthost)
export SMTP_USERNAME=$(</run/secrets/smtp_username)
export SMTP_PASSWORD=$(</run/secrets/smtp_username)

sed -i "s@\$SMTP_EMAIL_TO@${SMTP_EMAIL_TO}@g" /config/alertmanager.yml
sed -i "s@\$SMTP_EMAIL_FROM@${SMTP_EMAIL_FROM}@g" /config/alertmanager.yml
sed -i "s@\$SMTP_SMART_HOST@${SMTP_SMART_HOST}@g" /config/alertmanager.yml
sed -i "s@\$SMTP_USERNAME@${SMTP_USERNAME}@g" /config/alertmanager.yml
sed -i "s@\$SMTP_PASSWORD@${SMTP_PASSWORD}@g" /config/alertmanager.yml

/bin/alertmanager $@
