FROM amd64/node:8-alpine

LABEL maintainer="sunnydog0826@gmail.com"

COPY script.sh /bin/

RUN apk add --no-cache musl-dev gcc g++ python3 python3-dev curl ca-certificates git bash \
    && pip3 install -U pip \
    && chmod +x /bin/script.sh \
    && pip install shyaml \
    && npm config set registry https://registry.npm.taobao.org \
    && npm config set unsafe-perm true \
    && npm config set cache /root/.npm-cache --global \
    && npm install -g grunt grunt-cli bower
 
ENTRYPOINT ["/bin/script.sh"]