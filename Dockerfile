########################################################################
# Dockerfile for Oracle JDK 8 on Ubuntu 16.04
########################################################################

# pull base image
FROM openjdk:latest
USER root

RUN yum -y install wget unzip

WORKDIR /opt/

RUN cd /root && wget http://h2o-release.s3.amazonaws.com/h2o/rel-yu/3/h2o-3.28.0.3.zip -O h2o.zip \
    && unzip h2o.zip -d /opt && rm h2o.zip



RUN mkdir /opt/h2o && cd /opt/h2o

COPY docker-init.sh /opt/h2o/docker-init.sh
COPY GBM_model_python_1584541984902_1 /opt/h2o/model_files/GBM
RUN chmod +x /opt/h2o/docker-init.sh

EXPOSE 54321

# ENTRYPOINT ["java", "-Xmx2g", "-jar", "/tmp/h2o-3.28.0.3/h2o.jar"]
# Define default command
CMD ["/opt/h2o/docker-init.sh"]
