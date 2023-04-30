FROM golang:latest

WORKDIR /app/
COPY mod.go .
RUN go mod download && go mod verify
COPY . .
RUN go build -o go-app
CMD ["/app/go-app"]
