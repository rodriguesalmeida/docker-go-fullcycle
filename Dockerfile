FROM golang:alpine3.18 as build

WORKDIR /go/src/app

COPY . .

RUN go mod init hello-go

RUN go build -o main

FROM scratch as production

COPY --from=build /go/src/app/main /main

CMD ["./main"]