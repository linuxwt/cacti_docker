#!/bin/bash
mysqld --initialize-insecure --user=mysql > /dev/null &&
mysqld  &
sleep 10
mysql < /tmp/config.sql
sleep 10
ps -wef | grep mysql | grep -v grep | awk '{print $2}' | xargs kill -9
mysqld
