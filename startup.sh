#!/bin/bash

read -p 'Enter setup name [GridPP]: ' setupname
read -p 'Enter configuration server URL [dips://dirac01.grid.hep.ph.ic.ac.uk:9135/Configuration/Server]: ' configurl
setupname=${setupname:-'GridPP'}
configurl=${configurl:-'dips://dirac01.grid.hep.ph.ic.ac.uk:9135/Configuration/Server'}
. /root/dirac_ui/diracos/diracosrc
dirac-proxy-init -x -N
dirac-configure -F -S ${setupname} -C ${configurl} -I
echo "Configured OK."

read -p 'Creating grid proxy for which DIRAC group (i.e. <vo>_user) [dirac_user]: ' vo
vo=${vo:-'dirac_user'}
dirac-proxy-init -g $vo -M -U --Cert /root/.globus/usercert.pem --Key /root/.globus/userkey.pem
echo "proxy created OK."
