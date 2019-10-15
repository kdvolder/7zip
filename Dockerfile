FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y \
        curl \
        p7zip-full
ADD bin/* /usr/local/bin/
ADD fetch-windows-sfx.sh /tmp
RUN /tmp/fetch-windows-sfx.sh
