#! /bin/bash
cmd="$APP/dehydrated --config $CONFIG --accept-terms"

if [ -z ${DHR+x} ] ; then
	echo "What would you like to do?"
	echo "1) Register account key"
	echo "2) Update account contact information"
	echo "3) Sign/renew non-existent/changed/expiring certificates"
	echo "4) Sign a given CSR, output CRT on stdout (advanced usage)"
	echo "5) Revoke specified certificate"
	echo "6) Move unused certificate files to archive directory"
	read choice
else
	choice=$DHR
fi

case $choice in
	1)
		$cmd --register
	;;
	2)
		$cmd --account
	;;
	3)
		$cmd --cron
	;;
	4)
		$cmd --signcsr
	;;
	5)
		$cmd --revoke
	;;
	6)
		$cmd --cleanup
	;;
esac
