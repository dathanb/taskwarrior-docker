FROM alpine:latest
LABEL maintainer="Lukas Dietrich <lukas@lukasdietrich.com>"

RUN apk --no-cache add taskd taskd-pki
RUN adduser -u 1030 -G users -D taskserver

COPY scripts /scripts

ENV TASKDDATA /data
VOLUME ["${TASKDDATA}"]
EXPOSE 53589

USER taskserver
ENTRYPOINT ["sh", "/scripts/run.sh"]
