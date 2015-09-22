#! /usr/bin/env bash
PATH_TO_XDEBUG_SETTINGS="/usr/local/etc/php/5.6/conf.d/ext-xdebug.ini"

restart_apache(){
  echo "Restarting Apache"
  sudo apachectl restart
}

all_done(){
  echo "All done!"
  exit 0
}

# If xdebug is enabled, then disable it.
if [[ -f ${PATH_TO_XDEBUG_SETTINGS} ]]; then
  echo "Disabling Xdebug"
  mv ${PATH_TO_XDEBUG_SETTINGS} ${PATH_TO_XDEBUG_SETTINGS}.disabled
  restart_apache
  all_done
fi

# If xdebug is disabled, then enable it.
if [[ -f ${PATH_TO_XDEBUG_SETTINGS}.disabled ]]; then
  echo "Enabling Xdebug"
  mv ${PATH_TO_XDEBUG_SETTINGS}.disabled ${PATH_TO_XDEBUG_SETTINGS}
  restart_apache
  all_done
fi