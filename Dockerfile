FROM golang:1.10

COPY . /go/src/github.com/fatedier/frp

RUN cd /go/src/github.com/fatedier/frp \
 && make \
 && mv bin/frpc /opt/frpc \
 && mv bin/frps /opt/frps \
 && mv conf/frpc.ini /opt/frpc.ini \
 && mv conf/frps.ini /opt/frps.ini \
 && make clean

WORKDIR /

# EXPOSE 80 443 6000 7000 7500

# ENTRYPOINT ["/frps"]

EXPOSE 7000 8090
 
CMD ["/opt/frps","-c","frps.ini"]
