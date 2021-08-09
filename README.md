# Docker image for dnsmasq-exporter

This is a docker image for Google's
[dnsmasq_exporter](https://github.com/google/dnsmasq_exporter).

I initially created it to allow me to create an image out of a patched source.
Now that my patch has been accepted, this defaults to the original source.

You can use this Dockerfile to build against your own patch by overridding the
build args `GIT_REPO` and `GIT_BRANCH`.

The `GIT_REPO` and `GIT_BRANCH` used to build an image can always be inspected
by looking at the file `/SOURCE`.

```console

$ docker run --rm -it --entrypoint "cat" sandipb/dnsmasq_exporter SOURCE
https://github.com/google/dnsmasq_exporter:master
```
