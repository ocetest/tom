#!/bin/bash

DEV=/facilities

cd /opt
mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.1 -Dpackaging=jar -Dfile=ojdbc7-12.1.0.1.jar

cd $DEV
mvn tomcat7:redeploy
