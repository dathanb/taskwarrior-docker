FROM alpine:latest
LABEL maintainer="Lukas Dietrich <lukas@lukasdietrich.com>"

RUN apk --no-cache add taskd taskd-pki

COPY scripts /scripts

ENV TASKDDATA /data
EXPOSE 53589

RUN adduser -u 1030 -G users -D taskserver
USER taskserver
VOLUME ["${TASKDDATA}"]
ENTRYPOINT ["sh", "/scripts/run.sh"]
