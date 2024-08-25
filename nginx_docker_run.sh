#!/bin/bash

docker run -d --name=nginx \
--network market-data \
--volume `pwd`/nginx.conf:/etc/nginx/conf.d/default.conf \
-p 8000:80 \
nginx
