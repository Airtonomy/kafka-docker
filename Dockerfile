FROM openjdk:11

SHELL ["/bin/bash", "-c"]

ARG kafka_version=3.0.0
ARG scala_version=2.13

ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
    KAFKA_HOME=/opt/kafka

ENV PATH=${PATH}:${KAFKA_HOME}/bin

COPY scripts/start-kafka.sh /usr/bin/

RUN wget "https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" -q -O "/tmp/kafka.tgz" \
  && mkdir -p /var/kafka \
  && tar xfz /tmp/kafka.tgz -C /opt \
  && ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME} \
  && rm -rf /tmp/kafka.tgz

VOLUME ["/var/kafka"]
WORKDIR /opt/kafka/bin

# Use "exec" form so that it runs as PID 1 (useful for graceful shutdown)
CMD ["start-kafka.sh"]
