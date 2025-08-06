# Build stage
FROM golang:1.22-alpine AS builder

WORKDIR /app
# Copy go.mod only (since go.sum does not exist)
COPY go.mod ./
RUN go mod download

# Copy the rest of the source code
COPY . .

RUN go build -v -o app

# Final stage
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/app .
EXPOSE 8080
CMD ["./app"]
