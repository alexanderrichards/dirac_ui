# syntax = docker/dockerfile:1.0-experimental
FROM centos:7
ARG dirac_version=v6r21p7
ARG lcgtools_version=v14r1
ARG python_version=27

RUN mkdir -p /root/.globus
RUN mkdir -p /root/dirac_ui

WORKDIR /root/dirac_ui

RUN wget -np -O dirac-install https://raw.githubusercontent.com/DIRACGrid/DIRAC/integration/Core/scripts/dirac-install.py
RUN chmod u+x dirac-install
RUN ./dirac-install -r $dirac_version -i $python_version -g $lcgtools_version

RUN --mount=type=secret,id=usercert,dst=/root/.globus/usercert.pem,readonly --mount=type=secret,id=userkey,dst=/root/.globus/userkey.pem,readonly . bashrc && dirac-proxy-init -x
RUN . bashrc && dirac-configure -F -S GridPP -C dips://dirac01.grid.hep.ph.ic.ac.uk:9135/Configuration/Server -I

CMD ["/bin/bash", "-l"]
