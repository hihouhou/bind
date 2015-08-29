#
# Bind server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Update & install packages for bind
RUN apt-get update && \
    apt-get install -y bind9

#Configure graphite-carbon
ADD named.conf.local /etc/bind/

#volume added
VOLUME ["/zones"]

EXPOSE 53 

CMD ["named", "-u", "bind", "-g", "-4", "-c", "/etc/bind/named.conf"]
