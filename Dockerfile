ARG UBUNTU_IMAGE=ubuntu:14.04@sha256:64483f3496c1373bfd55348e88694d1c4d0c9b660dee6bfef5e12f43b9933b30

FROM ${UBUNTU_IMAGE} AS installer

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        binutils ca-certificates curl file libelf1 libncurses5 \
    && rm -rf /var/lib/apt/lists/*

RUN set -eu; \
    curl -fsSL --retry 3 \
        https://downloads.sourceforge.net/project/fis-gtm/GT.M-amd64-Linux/V6.2-002A/gtm_V62002A_linux_x8664_pro.tar.gz \
        -o /tmp/gtm.tar.gz; \
    echo '951a254b851c089ef92c6f96e3c4561ffe61d9d76e4b00b60f40507baa7373ba  /tmp/gtm.tar.gz' | sha256sum -c -; \
    mkdir /tmp/gtm-source; \
    tar -xzf /tmp/gtm.tar.gz -C /tmp/gtm-source; \
    cd /tmp/gtm-source; \
    # Root ownership, unrestricted execution, /opt/gtm, M mode, uppercase utilities only.
    # Drop individual utility objects after linking; leave extracted sources in the build stage.
    printf '%s\n' root root n /opt/gtm y n n n n | sh ./configure; \
    test -x /opt/gtm/mumps; \
    test -f /opt/gtm/libgtmutil.so

FROM ${UBUNTU_IMAGE}

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends libelf1 libncurses5 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --uid 1000 m

COPY --from=installer /opt/gtm /opt/gtm
COPY --chmod=755 docker/entrypoint.sh /usr/local/bin/run-m

ENV gtm_dist=/opt/gtm \
    gtm_chset=M \
    LC_ALL=C \
    TERM=xterm \
    PATH=/opt/gtm:${PATH}

USER m
WORKDIR /work/day01
ENTRYPOINT ["/usr/local/bin/run-m"]
CMD ["-direct"]
