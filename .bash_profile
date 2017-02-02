#!/bin/bash

#
#               GENERAL UTILITY FUNCTIONS
#

#Function for searching Google from the OSX CLI. The search will open in the user's default web browser 
#Thanks Lewis
function google() { open "http://www.google.com/search?q= $*"; }

#Function for getting the user's current IP address
function ip() {
        curl 'https://api.ipify.org?format=json'
        echo      #Necessary to ensure the shell prompt wraps to the next line
}

#
#               PYTHON SPECIFIC FUNCTIONS
#

#Shortcut to use django-admin.py 
function django_admin() {
	python /usr/local/lib/python2.7/site-packages/django/bin/django-admin.py $*	
}


#
#               DOCKER FUNCTIONS
#

#Clear docker environment variables (for using Docker For Mac instead of Docker-Machine/Toolbox
function clear_docker_env() {
        unset DOCKER_TLS_VERIFY
        unset DOCKER_CERT_PATH
        unset DOCKER_MACHINE_NAME
        unset DOCKER_HOST
}

#Clear leftover docker images and containers
function clear_docker() {
        docker rmi $(docker images --quiet --filter "dangling=true")
        docker rm -v $(docker ps -a -q -f status=exited)
}

#Search running docker container names and open a shell into matches
#TODO: Handle case where more than one valid result
function dockerbash(){
        docker exec -it $(docker ps | grep "$*" | awk -F '        ' '{print $1}') bash
}
