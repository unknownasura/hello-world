FROM golang:alpine AS builder

WORKDIR /go

COPY code/ src/

RUN go install src/hello.go

FROM scratch

COPY --from=builder /go/bin/hello /

CMD [ "/hello" ]

