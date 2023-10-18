# syntax = docker/dockerfile:1

FROM centos:7
ARG dirac_version

RUN mkdir /root/dirac_ui
WORKDIR /root/dirac_ui

RUN curl -LO https://github.com/DIRACGrid/DIRACOS2/releases/latest/download/DIRACOS-Linux-$(uname -m).sh
RUN bash DIRACOS-Linux-$(uname -m).sh
RUN rm DIRACOS-Linux-$(uname -m).sh
RUN source diracos/diracosrc && pip install DIRAC==$dirac_version

WORKDIR /root
COPY startup.sh /root/startup.sh

CMD ["/bin/bash", "--init-file", "/root/startup.sh"]
