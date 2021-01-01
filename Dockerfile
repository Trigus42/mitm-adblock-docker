FROM alpine:latest

RUN apk update; \
    apk upgrade

RUN apk add --no-cache bash wget; \
    apk add --no-cache python3 py3-pip ; \
    # general build tools
    apk add --no-cache g++ python3-dev; \
    # for pyre2
    apk add --no-cache re2-dev libre2; \
    # for mitmproxy
    apk add --no-cache libffi-dev openssl-dev; \
    # clean up
    rm -rf /var/cache/apk/* /tmp/*

RUN pip install mitmproxy adblockparser pyre2

RUN mkdir /etc/mitm-adblock
ADD ./mitm-adblock /etc/mitm-adblock

# add entrypoint file
COPY entrypoint.sh /
RUN  chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# set build date
RUN date >/build-date.txt