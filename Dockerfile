FROM golang:latest

WORKDIR /app/
COPY . .
RUN go mod download && go mod verify
RUN go build -o go-app
CMD ["/app/go-app"]
