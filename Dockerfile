FROM golang:latest AS builder
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY . .
RUN go build main.go

FROM ubuntu:latest
WORKDIR /root/
COPY --from=builder /app/go-webapp-sample ./
CMD ["/root/go-webapp-sample"]
