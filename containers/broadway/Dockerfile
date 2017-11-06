FROM phusion/baseimage
maintainer neolao <contact@neolao.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive
ENV GDK_BACKEND broadway
ENV UBUNTU_MENUPROXY 0 
ENV LIBOVERLAY_SCROLLBAR 0

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libgtk-3-bin

RUN mkdir /etc/service/broadway
COPY broadway.sh /etc/service/broadway/run
RUN chmod +x /etc/service/broadway/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080

