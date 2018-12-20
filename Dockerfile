FROM golang:1.10

COPY . /go/src/github.com/fatedier/frp

RUN cd /go/src/github.com/fatedier/frp \
 && make \
 && mv bin/frpc /frpc \
 && mv bin/frps /frps \
 && mv conf/frpc.ini /frpc.ini \
 && mv conf/frps.ini /frps.ini \
 && make clean

WORKDIR /

# EXPOSE 80 443 6000 7000 7500

# ENTRYPOINT ["/frps"]

EXPOSE 7000 8090
 
CMD ["/frps","-c","frps.ini"]
