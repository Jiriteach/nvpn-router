#!/command/with-contenv bash

[[ "${DEBUG,,}" == trace* ]] && set -x

echo "Setup crond service"

cron_dir="/var/spool/cron/crontabs"
cron_file="$cron_dir/root"

rm -f "$cron_file"
touch "$cron_file"

if [[ "${RECREATE_VPN_CRON}" ]]; then
    echo "Create reconnection cron"
    echo "$RECREATE_VPN_CRON reconnect.sh" >> "$cron_file"
fi

if [[ "${CHECK_CONNECTION_CRON}" ]]; then
    echo "Create connectivity check cron"
    echo "$CHECK_CONNECTION_CRON checkconnection.sh" >> "$cron_file"
fi

exit 0
