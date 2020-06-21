#!/usr/bin/env bash

mvn clean package

echo 'Copy file...'

scp -1 ~/.ssh/id_rsa_pancha \
    target/books-1.0-SNAPSHOT.jar \
    pancha@192.168.0.107:/home/pancha

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa_pancha pancha@192.168.0.107 << EOF

pgrep java | xargs kill -9
nohup java -jar books-1.0-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'