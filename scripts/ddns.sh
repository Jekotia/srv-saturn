#! /bin/bash
source ${_SCRIPT_INIT}
source ${_SCRIPT_ROOT}/ddns.conf

duckURL="https://www.duckdns.org/update?domains=${duckDomains}&token=${duckToken}&ip=${duckIP}"

echo url="${duckURL}" | curl -k -o ${_LOGS}/ddns.log -K -
