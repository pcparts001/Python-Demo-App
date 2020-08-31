#!/bin/bash

# This is a script to start the Python demo app

nohup python3/bin/pyagent run -c appdynamics.cfg - pyton3/bin/gunicorn -w 2 -b 0.0.0.0:9000 demo.app:app &
