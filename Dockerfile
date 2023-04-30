FROM golang:alpine AS builder

WORKDIR /app/
COPY . .
RUN go mod download && go mod verify
RUN go build -o /go/bin/apprun

FROM scratch
COPY --from=builder /go/bin/apprun /go/bin/apprun
CMD ["/go/bin/apprun"]
