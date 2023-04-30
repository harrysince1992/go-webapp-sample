FROM golang:latest
WORKDIR /app/
COPY . .
RUN go mod download
RUN go build -o /go/bin/apprun
CMD ["/go/bin/apprun"]
