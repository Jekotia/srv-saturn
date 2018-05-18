#! /bin/bash
source ${_SCRIPTS_INIT}
source ${_SCRIPTS_ROOT}/ddns.conf

duckURL="https://www.duckdns.org/update?domains=${duckDomains}&token=${duckToken}&ip=${duckIP}"

echo url="${duckURL}" | curl -k -o ${_LOGS}/ddns.log -K -
