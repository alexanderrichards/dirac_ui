# syntax = docker/dockerfile:1.0-experimental
FROM centos:7
ARG dirac_version=v6r21p7
ARG lcgtools_version=v14r1
ARG python_version=27

RUN yum install -y wget

COPY bootstrap.sh /root
RUN mkdir -p /home/dirac_user/dirac_ui

WORKDIR /home/dirac_user/dirac_ui

RUN wget -np -O dirac-install https://raw.githubusercontent.com/DIRACGrid/DIRAC/integration/Core/scripts/dirac-install.py
RUN chmod u+x dirac-install
RUN ./dirac-install -r $dirac_version -i $python_version -g $lcgtools_version
RUN --mount=type=secret,id=proxy,dst=/tmp/x509up_u0 . /home/dirac_user/dirac_ui/bashrc && dirac-configure -F -S GridPP -C dips://dirac01.grid.hep.ph.ic.ac.uk:9135/Configuration/Server -I
RUN rm -f dirac-install

WORKDIR /home/dirac_user

ENTRYPOINT ["/root/bootstrap.sh"]
