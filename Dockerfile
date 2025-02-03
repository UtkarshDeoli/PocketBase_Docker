FROM alpine:latest

ARG PB_VERSION=0.25.0

RUN apk add --no-cache \
    unzip \
    ca-certificates

# Download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && \
    rm /tmp/pb.zip && \
    chmod +x /pb/pocketbase

# Ensure pb_data is persistent
VOLUME /pb/pb_data

# Uncomment to use a static website using pb_public
#VOLUME /pb/pb_public

# Uncomment to copy the local pb_migrations directory into the image
# COPY ./pb_migrations /pb/pb_migrations

# Uncomment to copy the local pb_hooks directory into the image
# COPY ./pb_hooks /pb/pb_hooks

EXPOSE 8080

# Start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]

