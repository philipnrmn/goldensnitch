FROM golang:1.12.6 as builder
COPY main.go .
RUN go get -d
RUN cd $GOPATH/src/k8s.io/klog && git checkout v0.4.0
RUN go build -o /app main.go

FROM debian:buster-slim
CMD ["./app"]
COPY --from=builder /app .
