# Airtonomy Docker Kafka Container

## Getting Started

An example docker-compose file is provided to show the use of this docker file.

Any `KAFKA_` environment variables will be added to the server.properties file on startup through the `start-kafka.sh` script.

`KAFKA_ZOOKEEPER_CONNECT` is required and should be set to the zookeeper URL. For example `localhost:2181`.

## Creating a topic

```
docker-compose up -d

# Create the gettingstarted topic
docker exec -it kafka-docker-kafka-1 bash -c "kafka-topics.sh \
    --bootstrap-server kafka:29092 \
    --partitions 1 \
    --replication-factor 1 \
    --topic start \
    --create"
```

## Subscribing to a topic

```
docker exec -it kafka-docker-kafka-1 bash -c "kafka-console-consumer.sh --bootstrap-server kafka:29092 --topic start"
```

## Publishing to a topic

```
docker exec -it kafka-docker-kafka-1 bash -c "kafka-console-producer.sh --bootstrap-server kafka:29092 --topic start"
```

## Credits

This is adapted from [wurstmeister/kafka-docker](https://github.com/wurstmeister/kafka-docker).
