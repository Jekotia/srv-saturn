#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/conf

duckURL="https://www.duckdns.org/update?domains=${duckDomains}&token=${duckToken}&ip=${duckIP}"

echo url="${duckURL}" | curl -k -o ${DIR}/duck.log -K -
