FROM golang:alpine
RUN mkdir /app
COPY . /app/
WORKDIR /app
RUN apk update && apk add git
RUN go get -u github.com/gorilla/mux
RUN go build -o go-service .
CMD ["/app/go-service"]