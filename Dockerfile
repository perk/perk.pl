FROM alpine
LABEL maintainer=<marcin.stozek@gmail.com>

RUN set -x \
  && apk --no-cache add \
       ca-certificates \
       curl \
       tar

ENV HUGO_VERSION 0.55.6
RUN set -x \
  && mkdir /opt/hugo \
  && curl -sSL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar -v -C /opt/hugo -xz \
  && ln -s /opt/hugo/hugo /usr/local/bin/hugo

WORKDIR /usr/src/www/
COPY . /usr/src/www/

CMD [ "./release.sh" ]
