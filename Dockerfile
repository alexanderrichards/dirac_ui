# syntax = docker/dockerfile:1.0-experimental
FROM centos:7
ARG dirac_version=7.3.26

RUN mkdir /root/dirac_ui
WORKDIR /root/dirac_ui

RUN curl -LO https://github.com/DIRACGrid/DIRACOS2/releases/latest/download/DIRACOS-Linux-$(uname -m).sh
RUN bash DIRACOS-Linux-$(uname -m).sh
RUN rm DIRACOS-Linux-$(uname -m).sh
RUN source diracos/diracosrc && pip install DIRAC==$dirac_version
RUN --mount=type=secret,id=proxy,dst=/tmp/x509up_u0 source diracos/diracosrc && dirac-configure -F -S GridPP -C dips://dirac01.grid.hep.ph.ic.ac.uk:9135/Configuration/Server -I

WORKDIR /root
COPY startup.sh /root/startup.sh

CMD ["/bin/bash", "--init-file", "/root/startup.sh"]


