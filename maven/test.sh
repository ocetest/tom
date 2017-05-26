#!/bin/bash

DEV=/facilities


cd /opt
mvn install:install-file -DgroupId=oracle.com -DartifactId=ojdbc7 -Dversion=12.1.0.1 -Dpackaging=jar -Dfile=ojdbc7-12.1.0.1.jar
#notice the "/" and "\" in pom.xml when exec mvn deploy
cd $DEV
mvn -P lindev_80  tomcat7:redeploy
