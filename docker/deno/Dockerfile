FROM harurow/vue:current

ENV DENO_VERSION=1.10.3
ARG DEBIAN_FRONTEND=noninteractive

RUN groupadd deno \
 && useradd --gid node --shell /bin/bash --create-home deno
 
# install deno
RUN apt-get -qq update \
 && apt-get -qq install -y --no-install-recommends curl ca-certificates unzip \
 && curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip \
         --output deno.zip \
 && unzip deno.zip \
 && rm deno.zip \
 && chmod 755 deno \
 && mv deno /usr/local/bin/deno \
 && apt-get -qq remove --purge -y curl ca-certificates unzip \
 && apt-get -y -qq autoremove \
 && apt-get -qq clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 # smoke test
 && deno --version

ENV DENO_DIR /home/deno/.deno
ENV DENO_INSTALL_ROOT /home/deno/.deno
ENV PATH ${DENO_INSTALL_ROOT}/bin:${PATH}

ADD --chmod=755 docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "deno" ]
