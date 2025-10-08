# syntax=docker/dockerfile:1

FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fortune-mod \
    fortunes \
    cowsay \
    netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

WORKDIR /app

COPY wisecow.sh ./wisecow.sh
RUN chmod +x ./wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]