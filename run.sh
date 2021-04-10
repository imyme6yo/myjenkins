#!/bin/sh
# @AUTHOR: imyme6yo "imyme6yo@gmail.com"
# @DRAFT: 20210410
JENKINS_PORT="$1"
JENKINS_API_PORT="$2"

if [[ -z $JENKINS_PORT ]] ; then
    JENKINS_PORT=6688
fi

if [[ -z $JENKINS_API_PORT ]] ; then
    JENKINS_API_PORT=6699
fi

mkdir -p /var/jenkins
docker run \
       --name my-jenkins \
       -p ${JENKINS_PORT}:8080 \
       -p ${JENKSIN_API_PORT}:50000 \
       -v /var/jenkins:/var/jenkins_home \
       -v /var/run/docker.sock:/var/run/docker.sock \
       -v /usr/local/bin/docker-compose:/usr/local/bin/docker-compose \
       -u root jenkins/jenkins \
       jenkins
