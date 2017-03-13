#!/bin/bash

export HOME="/root"
export PATH="${PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"


if [[ $(cat /etc/timezone) != $TZ ]] ; then
  echo "Setting the correct time"
  echo "$TZ" > /etc/timezone
  dpkg-reconfigure -f noninteractive tzdata
  sed -i -e "s#;date.timezone.*#date.timezone = ${TZ}#g" /etc/php5/fpm/php.ini
  sed -i -e "s#;date.timezone.*#date.timezone = ${TZ}#g" /etc/php5/cli/php.ini
fi


cp /root/userscript-new.sh /config/userscript-new.sh
chmod +x /config/userscript-new.sh


./config/userscript-new.sh



