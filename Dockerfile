########################################################################
# Dockerfile for Oracle JDK 8 on Ubuntu 16.04
########################################################################

# pull base image
FROM openjdk:latest
USER root

RUN yum -y install wget unzip

RUN wget http://h2o-release.s3.amazonaws.com/h2o/rel-yu/3/h2o-3.28.0.3.zip -O h2o.zip && unzip h2o.zip \
    && cd  h2o-3.28.0.3/

COPY docker-init.sh /root

EXPOSE 54321

#ENTRYPOINT ["java", "-Xmx4g", "-jar", "/opt/h2o.jar"]
# Define default command

CMD ["/root/docker-init.sh"]
