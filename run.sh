#!/bin/sh

ssh m1 'cd ~/storm_cluster/zookeeper;./bin/zkServer.sh start'
ssh m1 'cd ~/storm_cluster/storm; nohup ./bin/storm nimbus > nimbus.out 2> nimbus.err < /dev/null &'
ssh m1 'cd ~/storm_cluster/storm; nohup ./bin/storm ui > ui.out 2> ui.err < /dev/null &'

declare -a arr=("m2" "m3" "m4")
for i in "${arr[@]}"
do
   ssh $i 'cd ~/storm_cluster/storm; nohup ./bin/storm supervisor > supervisor.out 2> supervisor.err < /dev/null &'
done


