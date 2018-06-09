#! /bin/bash
if [ ! -e ${DATA}/config.yml ] ; then
	echo "No config found. Downloading and then exiting."
	wget https://raw.githubusercontent.com/Athou/commafeed/${COMMAFEED_VER}/config.yml.example -O ${DATA}/config.yml
	exit 1
fi

chown -R ${USER}:${GROUP} ${APP}
chown -R ${USER}:${GROUP} ${DATA}

su-exec ${USER}:${GROUP} java -Djava.net.preferIPv4Stack=true -jar commafeed.jar server ${DATA}/config.yml
