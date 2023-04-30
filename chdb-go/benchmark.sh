#!/bin/bash

# Install chdb-go + libchdb.so library
sudo apt-get update && sudo apt-get install -y wget
wget https://github.com/metrico/chdb-go/releases/download/v0.6.2/chdbgo && chmod +x chdbgo 
wget https://github.com/metrico/chdb-go/releases/download/v0.6.2/libchdb.x86_64-linux-gnu.zip && sudo unzip libchdb.x86_64-linux-gnu.zip -d /
rm -rf https://github.com/metrico/chdb-go/releases/download/v0.6.2/libchdb.x86_64-linux-gnu.zip

# Load the data
seq 0 99 | xargs -P100 -I{} bash -c 'wget --continue https://datasets.clickhouse.com/hits_compatible/athena_partitioned/hits_{}.parquet'

# Run the queries

./run.sh 2>&1 | tee log.txt
