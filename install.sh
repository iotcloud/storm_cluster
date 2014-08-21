wget http://download.nextag.com/apache/incubator/storm/apache-storm-0.9.2-incubating/apache-storm-0.9.2-incubating.tar.gz
tar -xvf apache-storm-0.9.2-incubating.tar.gz
ln -s apache-storm-0.9.2-incubating storm
wget http://apache.arvixe.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -xvf zookeeper-3.4.6.tar.gz
ln -s zookeeper-3.4.6 zookeeper
cp zookeeper/conf/zoo_sample.cfg zookeeper/conf/zoo.cfg
cp storm.yaml storm/conf/

