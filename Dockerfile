FROM alpine:3.7

ENV AWSCLI_VERSION "1.18.55-r0"

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
