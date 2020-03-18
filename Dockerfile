########################################################################
# Dockerfile for Oracle JDK 8 on Ubuntu 16.04
########################################################################

# pull base image
FROM openjdk:latest
USER root

RUN yum -y install wget unzip

WORKDIR /root

RUN cd /root && wget http://h2o-release.s3.amazonaws.com/h2o/rel-yu/3/h2o-3.28.0.3.zip -O h2o.zip \
    && unzip h2o.zip -d /tmp



RUN mkdir /tmp/h2o && cd /tmp/h2o

COPY docker-init.sh /tmp/h2o/docker-init.sh

RUN chmod +x /tmp/h2o/docker-init.sh

EXPOSE 54321

# ENTRYPOINT ["java", "-Xmx2g", "-jar", "/tmp/h2o-3.28.0.3/h2o.jar"]
# Define default command
CMD ["/tmp/h2o/docker-init.sh"]
