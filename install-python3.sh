#!/bin/sh -x

sudo yum -y install python36 python-pip
sudo pip3 install virtualenv
virtualenv -p python3 python3
source python3/bin/activate
python3/bin/pip3 install -r requirements.txt
python3/bin/pip3 install appdynamics
python3/bin/pip3 list
