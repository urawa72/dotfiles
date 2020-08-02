FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y upgrade
RUN apt install -y \
  git \
  wget \
  gettext \
  build-essential \
  libtinfo-dev \
  libacl1-dev \
  libgpm-dev \
  libperl-dev \
  python-dev \
  python3-dev \
  ruby-dev \
  lua5.2 \
  liblua5.2-dev \
  autoconf \
  automake \
  cproto \
  bison \
  pkg-config \
  libevent-dev \
  libncurses5-dev

CMD ["/bin/bash"]
