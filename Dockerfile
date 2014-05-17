# Dockerfile for building a kegbot server

FROM ubuntu:14.04
MAINTAINER Dennis Coldwell <dennis.coldwell@gmail.com>

# take care of our Linux environment
RUN		apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
		gcc \
		openssh-server \
		python-dev \
		python-pip \
		libjpeg-dev \
		libmysqlclient-dev \
		mysql-client \
		mysql-server \
		redis-server \
		supervisor \
		nginx \
		--no-install-recommends

# Install kegbot
RUN 	pip install -U kegbot

# Copy over the kegbot run script & set executable bit
ADD 	run_kegbot /run_kegbot
RUN 	chmod 700 run_kegbot

# Add VOLUMEs to allow backup of databases/kegbot data
VOLUME 	["/var/lib/mysql", "/var/lib/redis", "/kegbot-data"]

# Expose the port for the container
EXPOSE 	8000

CMD 	["./run_kegbot"]
