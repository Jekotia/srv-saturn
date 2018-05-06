docker container rm -f alerthub

docker run \
-d \
--name alerthub \
-v /saturn/data/alerthub/config.js:/data/config.js:ro \
jekotia/alerthub

docker attach alerthub
