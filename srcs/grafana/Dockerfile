FROM alpine:latest
LABEL key="mbrizion"

RUN apk update && apk add grafana

COPY start.sh .

CMD ["sh", "start.sh"]