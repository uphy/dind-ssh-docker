#!/bin/sh

echo Creating the user: $USER
addgroup docker && \
adduser -D $USER -Gdocker -s /bin/sh > /dev/null 2>&1
echo "$USER:$PASSWORD" | chpasswd > /dev/null 2>&1

echo Generating ssh host keys...
ssh-keygen -A > /dev/null 2>&1
echo Start the supervisord
supervisord -c /etc/supervisord.conf