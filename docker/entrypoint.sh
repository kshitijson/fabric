#!/bin/sh

docker compose -f couchdb.yaml up -d

sleep 5

# Execute other setup commands (e.g., create _users database)
echo "Creating System Database user"
./wait-for-it.sh localhost:8984 -- curl -X PUT -u fd101:fd101 http://localhost:8984/_users

sleep 2

echo "Creating System Database replicator"
./wait-for-it.sh localhost:8984 -- curl -X PUT -u fd101:fd101 http://localhost:8984/_replicator

