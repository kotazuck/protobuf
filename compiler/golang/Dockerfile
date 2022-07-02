ARG LANGUAGE_VERSION

FROM golang:${LANGUAGE_VERSION}

ARG PROTOBUF_VERSION

RUN apt-get update && apt-get install -y unzip

WORKDIR /tmp/protoc

RUN curl -L -o protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip \
    && unzip protoc.zip \
    && mv bin/* /usr/local/bin \
    && mv include/* /usr/local/include

WORKDIR /usr/local/src/project

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["bash"]

CMD ["/docker-entrypoint.sh"]

