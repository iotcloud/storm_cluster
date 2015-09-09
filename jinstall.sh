#!/bin/sh

JSTORM_DIR=$1
JSTORM=~/jstorm_cluster/$JSTORM_DIR
echo $JSTORMo $JSTORM
cp jstorm.yaml $JSTORM/conf/storm.yaml
