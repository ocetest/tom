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
ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.55
ENV CATALINA_HOME /tomcat
ENV APP_DIR ${CATALINA_HOME}/webapps/

# Install tomcat
# RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz

# Install maven
#ADD http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz /opt/

COPY apache-maven-3.5.0-bin.tar.gz /opt/
COPY ojdbc7.jar /opt/
COPY apache-tomcat-7.0.55.tar.gz apache-tomcat-7.0.55.tar.gz

RUN tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat

RUN tar xzf /opt/apache-maven-3.5.0-bin.tar.gz -C /opt && \
    mv /opt/apache-maven-${MAVEN_VERSION} /opt/maven  && \
    ln -s /opt/maven/bin/mvn /usr/bin/mvn


ADD scripts /scripts

COPY settings.xml /opt/maven/conf/settings.xml
RUN cd /opt && \
    mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar -Dfile=ojdbc7.jar
ADD hello /hello
RUN cd /hello && \
    mvn clean install -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true

EXPOSE 8080 8443

ENTRYPOINT ["/scripts/run"]

ONBUILD ADD . ${APP_DIR}

