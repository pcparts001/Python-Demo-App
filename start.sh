#!/bin/sh -x

ENV=python3
$ENV/bin/pyagent run -c appdynamics.cfg - $ENV/bin/gunicorn -w 2 -b 0.0.0.0:9000 demo.app:app 
