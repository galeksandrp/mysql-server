FROM mysql:5.7.31 as myslq-toolchain
RUN apt-get update && apt-get install -y build-essential cmake libssl-dev libncurses5-dev pkg-config bison
COPY . /root/mysql-sources
WORKDIR /root/mysql-binaries
RUN cmake ../mysql-sources -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/root/boost-sources
WORKDIR /root/mysql-binaries/client
RUN make mysqldump
FROM mysql:5.7.31
COPY --from=myslq-toolchain /root/mysql-binaries/client/mysqldump /usr/bin/mysqldump-tldr
