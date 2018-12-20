FROM golang:1.10

COPY . /go/src/github.com/fatedier/frp

RUN cd /go/src/github.com/fatedier/frp \
 && make \
 && mkdir -p /opt/frp/conf \
 && mv bin/frpc /opt/frp/frpc \
 && mv bin/frps /opt/frp/frps \
 && mv conf/frpc.ini /opt/frp/conf/frpc.ini \
 && mv conf/frps.ini /opt/frp/conf/frps.ini \
 && make clean

WORKDIR /opt/frp/

# EXPOSE 80 443 6000 7000 7500

# ENTRYPOINT ["/frps"]

EXPOSE 7000 8090
 
CMD ["/opt/frp/frps","-c","/opt/frp/frps/conf/frps.ini"]
