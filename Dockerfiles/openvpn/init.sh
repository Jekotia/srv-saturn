#! /bin/bash
OVPN_DATA=/saturn/data/openvpn
ovpnImage="jekotia/test:openvpn"
cmd=docker

case $1 in
	init)
		$cmd run --rm -v $OVPN_DATA:/etc/openvpn $ovpnImage ovpn_genconfig -u udp://saturn.jekotia.net && \
		$cmd run --rm -it -v $OVPN_DATA:/etc/openvpn $ovpnImage ovpn_initpki
	;;
	run)
		$cmd run --name openvpn -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN $ovpnImage
	;;
	config)
		shift
		clientName="$1"
		$cmd run --rm -it -v $OVPN_DATA:/etc/openvpn $ovpnImage easyrsa build-client-full $clientName nopass && \
		$cmd run --rm -v $OVPN_DATA:/etc/openvpn $ovpnImage ovpn_getclient $clientName > $clientName.ovpn
	;;
esac

#docker-compose run --rm openvpn easyrsa build-client-full $1 nopass
#docker-compose run --rm openvpn ovpn_getclient $1 > $1.ovpn

