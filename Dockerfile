# SuperNETs Anope - Developed by acidvegas (https://github.com/acidvegas)
# anope/Dockerfile

# Use a bare minimal Alpine Linux base image
FROM alpine:3.24

# Install build dependencies
RUN apk add --no-cache build-base cmake libstdc++

# Copy the Anope source code to the container
COPY . /tmp/anope

# Create a user and directory for Anope
RUN addgroup -g 1000 anope && adduser -D -u 1000 -G anope -s /bin/sh anope && mkdir -p /opt/anope && chown -R anope:anope /tmp/anope /opt/anope

# Switch to the user
USER anope

# Build & install Anope
RUN cd /tmp/anope \
    && cmake -B build -DINSTDIR=/opt/anope -DCMAKE_BUILD_TYPE=RELEASE \
    && make -C build -j$(nproc) \
    && make -C build install \
    && rm -rf /tmp/anope

# Set the entrypoint to start Anope in the foreground
ENTRYPOINT ["/opt/anope/bin/services", "--nofork"]
