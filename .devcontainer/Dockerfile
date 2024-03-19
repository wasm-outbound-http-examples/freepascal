# partially based on https://github.com/dev-wasm/dev-wasm-pascal/blob/main/.devcontainer/Dockerfile
FROM ubuntu:22.04 AS builder

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y --no-install-recommends ca-certificates fpc git lld-15 make && \
    update-alternatives --install /usr/bin/wasm-ld wasm-ld /usr/bin/wasm-ld-15 80 && \
    git clone --depth=1 https://gitlab.com/freepascal.org/fpc/source.git fpc && \
    cd fpc && \
    make clean all OS_TARGET=wasi CPU_TARGET=wasm32 BINUTILSPREFIX= OPT="-O-" PP=fpc && \
    make crossinstall OS_TARGET=wasi CPU_TARGET=wasm32 INSTALL_PREFIX=/root/fpcwasm


FROM ubuntu:22.04

COPY --from=builder /root/fpcwasm /root/fpcwasm

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y --no-install-recommends lld-15 && \
    update-alternatives --install /usr/bin/wasm-ld wasm-ld /usr/bin/wasm-ld-15 80 && \
    export FPCVERSION=$(/root/fpcwasm/lib/fpc/*/ppcrosswasm32 -iV) && echo "FPCVERSION=$FPCVERSION" && \
    update-alternatives --install /usr/bin/fpcwasm fpcwasm /root/fpcwasm/lib/fpc/$FPCVERSION/ppcrosswasm32 80 && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
