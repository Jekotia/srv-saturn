#! /bin/bash
sslRoot=${_ROOT}/ssl
sslData=${_ROOT}/data/ssl

cd $sslRoot/dehydrated
./dehydrated --config $sslRoot/config $@

if [ -f "/tmp/cert-update-success" ]; then
	rm -rf /tmp/cert-update-success
	echo "Restarting docker proxy"
	docker restart proxy
	if [ $? -eq 0 ] ; then
		echo "Successfully restarted docker proxy"
	else
		echo "Failed to restart docker proxy"
	fi
fi

exit $?

