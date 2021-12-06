docker run -it --rm --name kafka_cli --network kafka_nwk -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper_svr:2181 bitnami/kafka:3 bash
