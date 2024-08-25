#!/bin/bash

#docker stop nginx

for i in {1..3}; do
  docker stop market-data-$i
done