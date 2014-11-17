# Docker Container for ubuntuElixir
# (c) 2014 EdgeCase, Inc.  sam@edgecase.io
# 
FROM x684867/ubuntucore14.04
MAINTAINER Sam Caldwell <mail@samcaldwell.net>

ENV DEBIAN_FRONTEND noninteractive

RUN \
   URL=http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
   echo "URL: $URL" && \
   wget $URL && \
   dpkg -i erlang-solutions_1.0_all.deb && \
   echo "erlang-solutions installed."

RUN apt-get update --fix-missing -y && \
    apt-get install erlang-base \
                    erlang-dev \
                    build-essential \
                    git-core -y



RUN \
   cd /opt/ && \
   mkdir -p /opt/src && \
   git clone https://github.com/clutchanalytics/cowboy && \
   cd cowboy && \
   make clean && \
   make all




CMD ["/bin/bash"]