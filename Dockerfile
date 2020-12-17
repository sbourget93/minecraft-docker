FROM ubuntu:18.04

RUN groupadd -g 9999 minecraft \
&& useradd -m -u 9999 -g minecraft minecraft

RUN mkdir -p /app && chown -R 9999:9999 /app

WORKDIR /app

RUN apt-get update -qq \
&& apt-get install -y -qq \
default-jre

USER minecraft

COPY --chown=9999:9999 README.md .
COPY --chown=9999:9999 server-files/1.16.4/server.jar ./server/server.jar
COPY --chown=9999:9999 server-files/eula.txt ./server/eula.txt
COPY --chown=9999:9999 server-files/run_server.sh ./server/run_server.sh

ENTRYPOINT ["/app/server/run_server.sh"]
