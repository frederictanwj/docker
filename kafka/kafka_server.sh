# docker network create kafka_net
# docker volume create zookeeper_vol
# docker volume create kafka_vol

# zookeeper
# docker run -d --name zookeeper_svr --network kafka_net -v zookeeper_vol:/bitnami/zookeeper -e ALLOW_ANONYMOUS_LOGIN=yes bitnami/zookeeper:3.7
docker run -d --name zookeeper_svr --network kafka_net -e ZOOKEEPER_CLIENT_PORT=2181 confluentinc/cp-zookeeper:latest

# kafka broker 1
# docker run -d --name kafka_svr1 --network kafka_net -p 9092:9092 -v kafka_vol:/bitnami/kafka -e ALLOW_PLAINTEXT_LISTENER=yes -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper_svr:2181 bitnami/kafka:3
docker run -d --name kafka_svr --network kafka_net -p 9092:9092 -e KAFKA_ZOOKEEPER_CONNECT=zookeeper_svr:2181 -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 confluentinc/cp-kafka:latest

# kafka broker 2
# docker run -d --name kafka_svr2 --network kafka_net -e ALLOW_PLAINTEXT_LISTENER=yes -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper_svr:2181 bitnami/kafka:3
