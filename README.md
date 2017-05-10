[![Docker Automated buil](https://img.shields.io/docker/automated/alexanderrichards/dirac_ui.svg)](https://hub.docker.com/r/alexanderrichards/dirac_ui)
# dirac_ui
To run a container from this image the VO must be passed as an environment variable and the globus grid cert/key directory must be mounted as a volume. To do this use the following.

```bash
sudo docker run -e vo=<your VO> -v <grid cert/key dir>:/home/dirac/.globus -it alexanderrichards/dirac_ui
```

If your using udocker to run in userspace, this becomes:

```bash
udocker run --env="vo=<your VO>" --volume=<grid cert/key dir>:/home/dirac/.globus alexanderrichards/dirac_ui
```
