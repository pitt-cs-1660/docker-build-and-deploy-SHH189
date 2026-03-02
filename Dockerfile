FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod ./

COPY main.go ./
COPY templates ./templates

RUN CGO_ENABLED=0 go build -o cs1660-assignment2 .

FROM scratch

WORKDIR /app

COPY --from=builder /app/cs1660-assignment2 /app/cs1660-assignment2
COPY --from=builder /app/templates /app/templates

ENTRYPOINT ["/app/cs1660-assignment2"]