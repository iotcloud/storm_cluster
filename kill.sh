#!/bin/sh

declare -a arr=("cn04" "cn05" "cn06", "cn07")
for i in "${arr[@]}"
do
   val=`ssh $i jps | grep -ie supervisor | sed 's/\([0-9]\) .*/\1/'`
   ssh $i kill $val
done

#val=`ssh m1 jps | grep -ie core | sed 's/\([0-9]\) .*/\1/'`
#ssh m1 kill $val
val=`ssh m1 jps | grep -ie nimbus | sed 's/\([0-9]\) .*/\1/'`
ssh m1 kill $val
ssh m1 'cd ~/jstorm_cluster/zookeeper;./bin/zkServer.sh stop'
