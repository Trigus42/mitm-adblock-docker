FROM alpine:3.14

RUN apk update; \

    apk add --no-cache bash wget; \
    apk add --no-cache python3 py3-pip ; \
    # general build tools, libs
    apk add --no-cache g++ python3-dev re2-dev libre2 libffi-dev openssl-dev; \

    export CRYPTOGRAPHY_DONT_BUILD_RUST=1; \
    pip install mitmproxy adblockparser pyre2; \

    # clean up
    apk del --no-cache --purge g++ python3-dev re2-dev libffi-dev openssl-dev; \
    rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /etc/mitm-adblock
ADD ./mitm-adblock /etc/mitm-adblock

# add entrypoint file
COPY entrypoint.sh /
RUN  chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# set build date
RUN date >/build-date.txt