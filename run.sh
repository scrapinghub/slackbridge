#!/bin/bash

if [[ ${CFGFILE} ]]; then
  cp ${CFGFILE} /slack-irc/config.json
fi

case ${1} in
  start)
    /usr/bin/supervisord -n -c /supervisord.conf
    ;;
  *)
    $*
    ;;
esac
