# Kegbot Docker Project

To help make it as easy as possible to get the kegbot up and running, we've
created a Docker file to help.

You should be able to run:

`docker pull dencold/kegbot`

In order to grab the docker image. Create a data container for all of the files
you'd want access to:

```
sudo docker run \
	-v /var/lib/mysql \
	-v /var/lib/redis \
	-v /kegbot-data \
	--name KEGDATA \
	busybox true
```

Now kickoff the container that will actually run the kegbot server. Don't forget to attach the 
data dir we just created.

`sudo docker run -d --volumes-from KEGDATA --name kegbot -p 80:8000 dencold/kegbot`

You should be able to hit up the kegbot server directly from localhost.