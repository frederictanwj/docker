docker run -d --name zookeeper_svr --network kafka_nwk -v zookeeper_vol:/bitnami/zookeeper -e ALLOW_ANONYMOUS_LOGIN=yes bitnami/zookeeper:3.7

docker run -d --name kafka_svr --network kafka_nwk -v kafka_vol:/bitnami/kafka -e ALLOW_PLAINTEXT_LISTENER=yes -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper_svr:2181 bitnami/kafka:3 
