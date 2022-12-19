FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get install -y vim build-essential git cmake net-tools gdb clang
RUN apt-get install -y autoconf automake texinfo autopoint bison gperf rsync gettext wget curl

# coreutils
WORKDIR /work
RUN curl https://ftp.gnu.org/gnu/coreutils/coreutils-9.1.tar.xz | tar xJk
WORKDIR /work/coreutils-9.1
RUN FORCE_UNSAFE_CONFIGURE=1 CFLAGS=-g ./configure
RUN make -j
COPY launch.json tasks.json .vscode/

# findutils
WORKDIR /work
RUN curl https://ftp.gnu.org/gnu/findutils/findutils-4.9.0.tar.xz | tar xJk
WORKDIR /work/findutils-4.9.0
RUN FORCE_UNSAFE_CONFIGURE=1 CFLAGS=-g ./configure
RUN make -j
COPY launch.json tasks.json .vscode/

# grep
WORKDIR /work
RUN curl https://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz | tar xJk
WORKDIR /work/grep-3.8
RUN FORCE_UNSAFE_CONFIGURE=1 CFLAGS=-g ./configure
RUN make -j
COPY launch.json tasks.json .vscode/

# tar
WORKDIR /work
RUN curl https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz | tar xJk
WORKDIR /work/tar-1.34
RUN FORCE_UNSAFE_CONFIGURE=1 CFLAGS=-g ./configure
RUN make -j
COPY launch.json tasks.json .vscode/

# diffutils
WORKDIR /work
RUN curl https://ftp.gnu.org/gnu/diffutils/diffutils-3.8.tar.xz | tar xJk
WORKDIR /work/diffutils-3.8
RUN FORCE_UNSAFE_CONFIGURE=1 CFLAGS=-g ./configure
RUN make -j
COPY launch.json tasks.json .vscode/

WORKDIR /work
