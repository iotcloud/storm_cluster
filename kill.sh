#!/bin/sh

declare -a arr=("cn15" "cn07" "cn05" "cn08" "cn09" "cn10" "cn11" "cn12")
#declare -a arr=("cn15" "cn16" "cn17" "cn18")
#declare -a arr=("cn06" "cn07" "cn05" "cn08")
for i in "${arr[@]}"
do
   val=`ssh $i jps | grep -ie supervisor | sed 's/\([0-9]\) .*/\1/'`
   ssh $i kill $val
done

for i in "${arr[@]}"
do
   val=`ssh $i jps | grep -ie Worker | sed 's/\([0-9]\) .*/\1/'`
   ssh $i kill $val
   ssh $i rm -rf /scratch/jstorm
   ssh $i rm -rf /scratch/jstorm_mapped
done

#val=`ssh m1 jps | grep -ie core | sed 's/\([0-9]\) .*/\1/'`
#ssh m1 kill $val
val=`ssh cn04 jps | grep -ie NimbusServer | sed 's/\([0-9]\) .*/\1/'`
ssh cn04 kill $val
ssh cn04 'cd ~/jstorm_cluster/zookeeper;./bin/zkServer.sh stop'
ssh cn04 rm -rf /scratch/zookeeper
ssh cn04 rm -rf /scratch/jstorm

