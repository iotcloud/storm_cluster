#!/bin/sh

JSTORM_DIR=$1

echo "Starting zookeeper cluster...."
ssh cn01 'cd ~/jstorm_cluster/zookeeper;./bin/zkServer.sh start'
echo "Starting storm cluster...."
ssh cn01 'cd ~/jstorm_cluster/$JSTORM_DIR; nohup ./bin/jstorm nimbus > nimbus.out 2> nimbus.err < /dev/null &'

declare -a arr=("cn06" "cn07" "cn04" "cn05")
for i in "${arr[@]}"
do
   ssh $i 'cd ~/jstorm_cluster/$JSTORM_DIR; nohup ./bin/jstorm supervisor > jsupervisor.out 2> jsupervisor.err < /dev/null &'
done
