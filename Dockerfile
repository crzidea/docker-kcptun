FROM alpine

ENV VERSION=20180926
ENV ARCH=arm
ENV ARCH_POSTFIX=arm7

RUN mkdir kcptun && \
    cd kcptun && \
    wget -q https://github.com/xtaci/kcptun/releases/download/v$VERSION/kcptun-linux-$ARCH-$VERSION.tar.gz && \
    tar xzf kcptun-linux-$ARCH-$VERSION.tar.gz && \
    rm kcptun-linux-$ARCH-$VERSION.tar.gz && \
    mv server_linux_$ARCH_POSTFIX kcptun-server && \
    mv client_linux_$ARCH_POSTFIX kcptun-client

WORKDIR kcptun

CMD ./kcptun-server --target "127.0.0.1:8388" --crypt none --nocomp

EXPOSE 29900
