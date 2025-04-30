# Use python base image for convenience, alpine variant for slimmer image
FROM python:3.13.3-alpine

# Install updates
RUN apk upgrade --no-cache

# Install prerequisites
RUN apk add --no-cache graphviz

# Install wireviz
RUN pip install --no-cache-dir wireviz

# Set workdir
WORKDIR /root/src

# Set entrypoint to a regular shell instead of a python prompt
ENTRYPOINT ["/bin/sh", "-c"]