#!/bin/sh

declare -a arr=("cn06" "cn07" "cn05" "cn08" "cn09" "cn10" "cn11" "cn12")
for i in "${arr[@]}"
do
   ssh $i rm -rf /scratch/jstorm
done

JSTORM_DIR=$1
JSTORM=~/jstorm_cluster/$JSTORM_DIR
echo $JSTORM
cp jstorm.yaml $JSTORM/conf/storm.yaml
cp jstorm.logback.xml $JSTORM/conf/
