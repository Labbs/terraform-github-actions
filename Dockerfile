FROM alpine:3 

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.18.55-r0 s3cmd==2.1.0-r0 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
