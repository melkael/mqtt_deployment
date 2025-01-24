FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    mosquitto \
    mosquitto-clients \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 1883
EXPOSE 9001

CMD ["mosquitto"]
