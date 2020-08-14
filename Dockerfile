FROM alpine:3.7

ENV AWSCLI_VERSION "1.18.119"

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install awscli==$AWSCLI_VERSION --upgrade --user \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
