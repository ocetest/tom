#!/bin/bash

DEV=/facilities

cd $DEV
mvn tomcat7:redeploy
