FROM scratch

WORKDIR /app/
COPY go-app .
CMD ["/app/go-app"]
