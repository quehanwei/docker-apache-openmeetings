
VERSION = 3.1.1

all: apache-openmeetings.tar.gz
	docker build -t dramaturg/apache-openmeetings .

apache-openmeetings.tar.gz:
	wget -O apache-openmeetings.tar.gz \
		http://archive.apache.org/dist/openmeetings/$(VERSION)/bin/apache-openmeetings-$(VERSION).tar.gz

push:
	docker tag dramaturg/apache-openmeetings dramaturg/apache-openmeetings:$(VERSION)
	docker push dramaturg/apache-openmeetings

run:
	docker run -d -t -i --name apache-openmeetings \
		-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
		-p 5080:5080 -p 1935:1935 -p 8088:8088 dramaturg/apache-openmeetings

