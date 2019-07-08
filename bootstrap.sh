#!/bin/bash
USER_ID=$(stat -c "%u" /home/dirac_user/.globus)
GROUP_ID=$(stat -c "%g" /home/dirac_user/.globus)

groupadd --gid $GROUP_ID dirac_group
useradd --uid $USER_ID --gid $GROUP_ID --no-create-home --no-user-group --base-dir /home --home-dir /home/dirac_user dirac_user

if [ -z "$1" ]
then
    exec runuser -l dirac_user -s /bin/bash
else
    exec runuser -l dirac_user -s /bin/bash -c "$@"
fi
