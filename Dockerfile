FROM golang:1.16-alpine

WORKDIR /app

COPY go.mod ./
COPY cmd/helloworld-go-service/ ./

RUN go mod download

RUN go build -o /helloworld

CMD [ "/helloworld" ]