FROM alpine:3.7

ENV AWSCLI_VERSION "1.18.119"

RUN apk add --update --no-cache bash ca-certificates curl git jq openssh python py-pip

RUN pip install awscli==$AWSCLI_VERSION --upgrade
RUN apk --purge -v del py-pip
RUN rm -rf /var/cache/apk/*

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
