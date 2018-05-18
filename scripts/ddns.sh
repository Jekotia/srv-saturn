#! /bin/bash
source ${SRV_SCRIPTS_INIT}
source ${SRV_SCRIPTS_ROOT}/ddns.conf

duckURL="https://www.duckdns.org/update?domains=${duckDomains}&token=${duckToken}&ip=${duckIP}"

echo url="${duckURL}" | curl -k -o ${SRV_LOGS}/ddns.log -K -
