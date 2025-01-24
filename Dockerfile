# Use Ubuntu as the base image
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install Mosquitto broker and client
RUN apt-get update && \
    apt-get install -y \
    mosquitto \
    mosquitto-clients \
    && rm -rf /var/lib/apt/lists/*

# Create directory for persistent data and set permissions
RUN mkdir -p /mosquitto/data /mosquitto/log && \
    chown -R mosquitto:mosquitto /mosquitto

# Create a configuration file
COPY mosquitto.conf /etc/mosquitto/conf.d/

# Expose MQTT port
EXPOSE 1883

# Set the volume for persistent data and logs
VOLUME ["/mosquitto/data", "/mosquitto/log"]

# Start Mosquitto broker
CMD ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]
