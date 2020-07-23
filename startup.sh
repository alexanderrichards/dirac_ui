#!/bin/bash
read -p 'Creating grid proxy for which DIRAC group (i.e. <vo>_user): ' vo

. /root/dirac_ui/bashrc
dirac-proxy-init -g $vo -M --Cert /root/.globus/usercert.pem --Key /root/.globus/userkey.pem
