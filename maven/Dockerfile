#
# MAINTAINER        Jerry Xiao <ocellus@163.com>
# DOCKER-VERSION    1.6.2
#
# Dockerizing maven: Dockerfile for building maven images
#
FROM       bj/jdk:1.7.0
MAINTAINER Jerry Xiao <ocellus@163.com>

ENV MAVEN_VERSION 3.5.0
ENV MAVEN_HOME /opt/maven

# Install maven
#ADD http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz /opt/

COPY apache-maven-3.5.0-bin.tar.gz /opt/
COPY ojdbc7.jar /opt/

RUN tar xzf /opt/apache-maven-3.5.0-bin.tar.gz -C /opt && \
    mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven  && \
    ln -s /opt/maven/bin/mvn /usr/bin/mvn

COPY settings.xml /opt/maven/conf/settings.xml
RUN cd /opt && \
    mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar -Dfile=ojdbc7.jar
ADD hello /hello
RUN cd /hello && \
#    mvn clean install -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true
    mvn tomcat7:deploy
