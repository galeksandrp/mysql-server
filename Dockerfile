FROM alpine:3.10.3 AS mysql-tldr-alpine-build
COPY .
RUN mkdir bld
WORKDIR /root/bld
RUN cmake ..
RUN make
RUN make install
RUN rm -rf /root/bld
