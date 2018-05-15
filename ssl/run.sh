#! /bin/bash
sslRoot=${SRV_ROOT}/ssl
sslData=${SRV_ROOT}/data/ssl

chmod +x ${sslRoot}/dns-01-manual/hook.sh
$sslRoot/dehydrated/dehydrated --config $sslRoot/config $@
chmod -x ${sslRoot}/dns-01-manual/hook.sh
