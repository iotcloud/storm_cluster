#!/bin/sh

declare -a arr=("cn06" "cn07" "cn05" "c08" "c09" "c10" "c11" "c12")
for i in "${arr[@]}"
do
   val=`ssh $i jps | grep -ie supervisor | sed 's/\([0-9]\) .*/\1/'`
   ssh $i kill $val
done

#val=`ssh m1 jps | grep -ie core | sed 's/\([0-9]\) .*/\1/'`
#ssh m1 kill $val
val=`ssh cn01 jps | grep -ie NimbusServer | sed 's/\([0-9]\) .*/\1/'`
ssh cn01 kill $val
ssh cn01 'cd ~/jstorm_cluster/zookeeper;./bin/zkServer.sh stop'

