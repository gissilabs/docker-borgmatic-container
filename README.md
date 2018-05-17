# Borgmatic Docker container

[Borg](https://borgbackup.readthedocs.io/) and [borgmatic](https://torsion.org/borgmatic/) in an Alpine container for your backup needs. Updated whenever `alpine:latest`  is.

To see which version of borg this container is using, check this page: https://pkgs.alpinelinux.org/packages?name=borgbackup and choose the highest `vx.x` available (i.e. not edge). Or run this container with `docker image pull coaxial/borg && docker run --rm coaxial/borg borg --version`.

To see which version of borgmatic, have a look at the [Dockerfile](https://github.com/coaxial/docker-borgmatic-container/blob/master/Dockerfile#L2).

# Usage

Typically, you'd want to use this image as the base image for your backup container and add a volume for your ssh keys, your known_hosts file, and you backup directories.

```
FROM coaxial/borgmatic
VOLUME /data
VOLUME /root/.ssh
VOLUME /borgmatic
CMD ["borgmatic", "-c", "/borgmatic/config.yaml"]
```

You would then run it with `docker run --rm -v data_volume:/backup:ro -v ssh_volume:/root/.ssh:ro -v borgmatic_config:/borgmatic:ro myimage`.

The ssh_volume should contain the ssh keys to connect to the remote borg repo, and a known_hosts file to avoid the interactive message whether to accept the new ssh key on connecting to a remote host.

# Issues

Please open an issue describe the problem/feature request. I will consider adding more tags or architectures if there is a demand for them.
