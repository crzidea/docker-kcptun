FROM alpine

ENV VERSION=20231012

RUN mkdir kcptun && \
    cd kcptun && \
    wget -q https://github.com/xtaci/kcptun/releases/download/v$VERSION/kcptun-linux-amd64-$VERSION.tar.gz && \
    tar xzf kcptun-linux-amd64-$VERSION.tar.gz && \
    rm kcptun-linux-amd64-$VERSION.tar.gz && \
    mv server_linux_amd64 kcptun-server && \
    mv client_linux_amd64 kcptun-client

WORKDIR kcptun

CMD ./kcptun-server --target "127.0.0.1:8388" --listen :3478-3498 --tcp --crypt none --nocomp --quiet --dscp 46 --sndwnd 8192 --mode fast3 --smuxver 2 --sockbuf 16777217 --smuxbuf 16777217

EXPOSE 29900
