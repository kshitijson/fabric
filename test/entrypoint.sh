#!/bin/sh

docker compose -f couchdb.yaml up -d

sleep 5

# Execute other setup commands (e.g., create _users database)
echo "Creating System Database user"
./wait-for-it.sh localhost:6984 -- curl -X PUT -u admin:adminpw http://localhost:6984/_users

sleep 2

echo "Creating System Database replicator"
./wait-for-it.sh localhost:6984 -- curl -X PUT -u admin:adminpw http://localhost:6984/_replicator

