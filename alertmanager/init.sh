#/bin/sh

cat /config/alertmanager.yml | while IFS= read -r line; do
    echo $line
done

/bin/alertmanager $@
