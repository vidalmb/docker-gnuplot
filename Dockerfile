FROM --platform=linux/arm64 alpine:latest

CMD ["/bin/sh"]

MAINTAINER "Vidal Mate"

ENV GDFONTPATH=/usr/share/fonts/truetype/msttcorefonts/

# instalacion de fuentes de texto
RUN apk --no-cache --virtual .fontsinstaller add msttcorefonts-installer fontconfig && update-ms-fonts && fc-cache -f && apk del .fontsinstaller
# Instalacion de gnuplot y dependencias
RUN apk add gnuplot
# Comandos auxiliares
RUN mkdir -p /work

#RUN apk --update add libgd libpng libjpeg libwebp libjpeg-turbo cairo pango lua readline  && apk add --virtual .gnuplotbuild git gcc g++ libtool make automake autoconf cairo-dev pango-dev gd-dev lua-dev readline-dev libpng-dev libjpeg-turbo-dev libwebp-dev  && mkdir -p /src && cd /src  && git clone https://git.code.sf.net/p/gnuplot/gnuplot-main gnuplot-gnuplot-main   && cd gnuplot-gnuplot-main  && ./prepare  && ./configure  && make  && make install  && cd / && rm -rf /src/gnuplot-gnuplot-main  && apk del .gnuplotbuild  && mkdir -p /work  && rm /var/cache/apk/*

WORKDIR /work

#ENTRYPOINT ["/usr/local/bin/gnuplot"]
ENTRYPOINT ["/usr/bin/gnuplot"]

CMD ["--help"]
