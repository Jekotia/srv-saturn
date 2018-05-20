#! /bin/bash
OVPN_DATA=/saturn/data/openvpn
ovpnImage=jekotia/test:openvpn

docker run --rm -v $OVPN_DATA:/etc/openvpn $ovpnImage ovpn_genconfig -u udp://saturn.jekotia.net && \
docker run --rm -it -v $OVPN_DATA:/etc/openvpn $ovpnImage ovpn_initpki && \
docker run --rm -it -v $OVPN_DATA:/etc/openvpn $ovpnImage easyrsa build-client-full CLIENTNAME nopass && \
docker run --rm -v $OVPN_DATA:/etc/openvpn $ovpnImage ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn
