FROM debian:bullseye

WORKDIR /app

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --configure -a

RUN apt update -y
RUN apt install -y tzdata
RUN apt install -y wget
RUN apt install -y libssl-dev
RUN apt install -y cmake
RUN apt install -y git
RUN apt install -y gcc
RUN apt install -y g++
RUN apt install -y automake
RUN apt install -y libtool
RUN apt install -y autoconf
RUN apt install -y gnupg
RUN apt install -y gnupg2
RUN apt install -y libgmp-dev

RUN wget https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc; apt-key add erlang_solutions.asc
RUN echo "deb https://packages.erlang-solutions.com/ubuntu focal contrib" | tee /etc/apt/sources.list.d/erlang-solution.list
RUN apt update
RUN apt install -y erlang

RUN cd /tmp; git clone --recursive --depth 1 --branch N.2.5.3 https://github.com/ArweaveTeam/arweave.git
RUN cd /tmp/arweave; ./rebar3 as prod tar
RUN cd /app; tar -zxvf /tmp/arweave/_build/prod/rel/arweave/arweave-2.5.3.tar.gz

RUN ulimit -n 65535

ADD entrypoint.sh /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]
