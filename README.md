[![Docker Build Status](https://img.shields.io/docker/build/alexanderrichards/dirac_ui.svg)](https://hub.docker.com/r/alexanderrichards/dirac_ui/builds)

![Docker Image Version (latest semver)](https://img.shields.io/docker/v/alexanderrichards/dirac_ui?logo=docker&sort=semver)
# dirac_ui
To run a container from this image the globus grid cert/key directory must be mounted as a volume. To do this use the following.

```bash
sudo docker run -it -v <grid cert/key dir>:/root/.globus:ro alexanderrichards/dirac_ui
```

If your using udocker to run in userspace, this becomes:

```bash
udocker run --volume=<grid cert/key dir>:/root/.globus alexanderrichards/dirac_ui
```

![Image Usage Gif](examples/image_usage.gif)
