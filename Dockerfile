FROM alpine

ENV VERSION=20180316

RUN mkdir kcptun && \
    cd kcptun && \
    wget -q https://github.com/xtaci/kcptun/releases/download/v$VERSION/kcptun-linux-amd64-$VERSION.tar.gz && \
    tar xzf kcptun-linux-amd64-$VERSION.tar.gz && \
    rm kcptun-linux-amd64-$VERSION.tar.gz && \
    mv server_linux_amd64 kcptun-server && \
    mv client_linux_amd64 kcptun-client

WORKDIR kcptun

CMD ./kcptun-server --target "127.0.0.1:8388" --listen :5353 --crypt none --nocomp
