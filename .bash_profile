#!/bin/bash

#Function for searching Google from the OSX CLI. The search will open in the user's default web browser 
#Thanks Lewis
function google() { open "http://www.google.com/search?q= $*"; }

#Function for getting the user's current IP address
function ip() {
        curl 'https://api.ipify.org?format=json'
        echo      #Necessary to ensure the shell prompt wraps to the next line
}
