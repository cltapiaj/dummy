# Build stage
FROM golang:1.22-alpine AS builder

WORKDIR /app
# Copy go mod and sum files
COPY go.mod go.sum ./
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
