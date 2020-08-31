#!/bin/sh -x

URL=http://localhost:9000
EXTERNAL=http://www.google.com
INSTRUMENTED0=http://localhost:9000/wave/first
INSTRUMENTED1=http://localhost:9000/error/sometimes
CURL="curl -w '\n'"

while true
do
  $CURL ${URL}/wave/0
  $CURL ${URL}/wave/1
  $CURL ${URL}/wave/2
  $CURL ${URL}/wave/3
  $CURL ${URL}/wave/4
  $CURL ${URL}/wave/5
  $CURL ${URL}/wave/6
  $CURL ${URL}/wave/7
  $CURL ${URL}/wave/8
  $CURL ${URL}/error/always
  $CURL ${URL}/error/sometimes
  $CURL ${URL}/query/mysql
  $CURL ${URL}/http?url=${EXTERNAL}
  $CURL ${URL}/http?url=${INSTRUMENTED0}
  $CURL ${URL}/http?url=${INSTRUMENTED1}
done
