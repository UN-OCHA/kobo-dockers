FROM unocha/alpine-base-python3

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY kobobackup.py /srv/

RUN apk add --update-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    rm -rf /var/lib/apk/*

VOLUME ["/srv/backup"]

ENTRYPOINT ["python3 /kobobackup.py"]
