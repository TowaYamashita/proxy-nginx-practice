FROM alpine:20240315

RUN apk update && \
    apk add curl