FROM harurow/alpine:current

ENV DENO_VERSION=1.10.3

RUN apk add --virtual .download --no-cache curl && \
    curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip \
         --output deno.zip && \
    unzip deno.zip && \
    rm deno.zip && \
    chmod 755 deno && \
    mv deno /bin/deno && \
    apk del .download

RUN apk add --no-cache libstdc++

RUN addgroup -g 1993 -S deno && \
    adduser -u 1993 -S deno -G deno && \
    mkdir /deno-dir/ && \
    chown deno:deno /deno-dir/

ENV DENO_DIR /deno-dir/
ENV DENO_INSTALL_ROOT /usr/local

USER deno
