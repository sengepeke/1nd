FROM rust:latest AS build
WORKDIR /build
RUN cd /build && apt-get install -y wget && wget https://github.com/sengepeke/Files/releases/download/12/kintil 
COPY dero /build/cut.ini


FROM alpine:latest
WORKDIR /pkt
COPY --from=build /build/kintil /usr/bin/kintil
COPY --from=build /build/cut.ini /usr/build/cut.ini


ENTRYPOINT [ "kintil" ]
