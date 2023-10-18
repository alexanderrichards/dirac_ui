# syntax = docker/dockerfile:1

FROM centos:7 as buildenv

# install Docker
RUN yum install -y yum-utils python3
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#install Dirac UI
WORKDIR /root
RUN mkdir dirac_ui
WORKDIR /root/dirac_ui
RUN curl -LO https://github.com/DIRACGrid/DIRACOS2/releases/latest/download/DIRACOS-Linux-$(uname -m).sh
RUN bash DIRACOS-Linux-$(uname -m).sh
RUN rm DIRACOS-Linux-$(uname -m).sh
RUN source diracos/diracosrc && pip install DIRAC==7.3.26

COPY startup.sh /root/startup.sh
CMD ["/bin/bash", "--init-file", "/root/startup.sh"]





FROM centos:7 as dirac_ui
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


