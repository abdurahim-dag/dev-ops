FROM golang:1.17 AS builder
ARG VERSION

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN  CGO_ENABLED=0 GOOS=linux go build -o /app/myapp ./cmd/api

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/myapp /app
CMD ["/app/myapp"]

EXPOSE 8081