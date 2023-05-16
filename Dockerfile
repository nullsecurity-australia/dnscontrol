# syntax = docker/dockerfile:1.4

FROM golang:alpine AS builder
COPY . /go/src/dnscontrol
WORKDIR /go/src/dnscontrol
RUN apk --no-cache add git \
 && go run build/build.go -os linux \
 && cp dnscontrol-Linux dnscontrol

FROM alpine:latest AS runner
COPY --from=builder /go/src/dnscontrol/dnscontrol /usr/local/bin/
RUN apk --no-cache add curl

COPY dnscontrol /usr/local/bin/

WORKDIR /dns

ENTRYPOINT ["/usr/local/bin/dnscontrol"]
