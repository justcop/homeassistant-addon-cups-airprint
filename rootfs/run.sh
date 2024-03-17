#!/usr/bin/with-contenv bashio

ulimit -n 1048576

until [ -e /var/run/avahi-daemon/socket ]; do
  sleep 1s
done

bashio::log.info "Preparing directories"
cp -v -R /etc/cups /config/addons_config
rm -v -fR /etc/cups

ln -v -s /config/addons_config/cups /etc/cups
echo this is the contents of root folder
ls
#ln -v -s /config/addons_config/cups/filter /usr/lib/cups/filter

bashio::log.info "Starting CUPS server as CMD from S6"

cupsd -f
