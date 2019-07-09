#!/bin/bash
read -p 'Creating grid proxy for which VO: ' vo

. /home/dirac_user/dirac_ui/bashrc
dirac-proxy-init -g $vo -M
