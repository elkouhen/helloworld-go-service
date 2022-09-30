FROM golang:1.16-alpine

WORKDIR /app

COPY go.mod go.mod
COPY main.go main.go

RUN go mod download

RUN go build -o /helloworld

EXPOSE 8000

CMD [ "/helloworld" ]