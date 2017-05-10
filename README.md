# dirac_ui
To run a container from this image the VO must be passed as an environment variable and the globus grid cert/key directory must be mounted as a volume. To do this use the following.

```bash
sudo docker run -e vo=<your VO> -v <grid cert/key dir>:/home/dirac/.globus -it dirac_ui
```
