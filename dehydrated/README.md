docker run \
-it \
--name dehydrated \
-v /saturn/data/dehydrated:/data \
-e DHR=3 \
jekotia/dehydrated

docker container rm -f dehydrated
