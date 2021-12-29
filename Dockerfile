FROM ubuntu:20.04
LABEL maintainer Naba Das <hello@get-deck.com>

RUN mkdir -p /app
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ethereum/ethereum -y  && \
    add-apt-repository ppa:ethereum/ethereum-dev -y && \
    apt-get update && \
    apt-get install solc -y && \
    rm -r /var/lib/apt/lists/*
WORKDIR /app
VOLUME ["/app"]
CMD ["tail", "-f", "/var/log/dpkg.log"]