FROM rocproject/cross-arm-linux-gnueabihf:gcc-4.9@sha256:07f5053f4d0aa3e0ea19268e24cdece584df62d2530f7ea7fbbd3a6e70978d0f as builder


FROM debian:stretch-slim

COPY --from=builder /opt/toolchain /opt/toolchain

ENV PATH="/opt/toolchain/bin:${PATH}"

# Install dependencies
RUN apt update && apt install -y \
    make \
    bc \
    gcc \
    && rm -rf /var/lib/apt/lists/*
