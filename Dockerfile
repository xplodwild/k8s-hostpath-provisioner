FROM golang:1.15 AS builder

COPY ./ /src
WORKDIR /src
RUN go build -o /hostpath-provisioner hostpath-provisioner.go

FROM scratch AS release

COPY --from=builder /hostpath-provisioner /
CMD ["/hostpath-provisioner"]
