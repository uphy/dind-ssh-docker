# dind with ssh server

This image provides docker-in-docker with ssh access.  
You can use docker/docker-compose in this container.

Execute the following command.

```bash
$ docker network create dind-net
$ docker run --net dind-net -it --rm --privileged -p 10022:22 -v $(pwd)/data:/var/lib/docker uphy/dind:17.06.0-ce
```

I'm not sure why '--net' is required in my environment...

## Configuration

**Port**

SSH is running with the port 22 in this container.  
You can change the port by -p.

```bash
$ docker network create dind-net
$ docker run --net dind-net -it --rm --privileged -p 10022:22 -v $(pwd)/data:/var/lib/docker uphy/dind:17.06.0-ce
```

**Volume**

'dind' uses /var/lib/docker.  
You can change the volume by -v.

```bash
$ docker network create dind-net
$ docker run --net dind-net -it --rm --privileged -p 10022:22 -v $(pwd)/data:/var/lib/docker uphy/dind:17.06.0-ce
```

**Environment Variables**

|Name|Description|
|----|-----------|
|USER| The name of the SSH user|
|PASSWORD| The password of the SSH password|

```bash
$ docker network create dind-net
$ docker run --net dind-net -it --rm --privileged -p 10022:22 -v $(pwd)/data:/var/lib/docker -e USER=foo -e PASSWORD=password uphy/dind:17.06.0-ce
```