#!/bin/sh
export DB_USERNAME=asdasdsd
export DB_PASSWORD=asdasdas!
export DB_HOST=asdasds.com.br
export DB_NAME=asdasddsdasd
java -Dexternal.sys.properties=file:system.properties -Dexternal.app.properties=file:application.properties -jar backend-0.0.1.jar