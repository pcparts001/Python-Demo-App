AppDynamics Python Demo App
===============

A trivial Flask web app that can be used to demo performance monitoring features. The app has routes that do things like:

1. Sleep in a way that draws a pretty response time graph.
2. Raise uncaught exceptions in application code.
3. Simulate slow database calls in MySQL and PostgreSQL.
4. Make external HTTP calls.
5. Return HTTP errors (5xx and 4xx).

NOTE: To use the AppDynamics Python Agent, you must have a compatible (4.0+) AppDynamics controller in SAAS or On Premise and a license provisioned for Python agents.

## Installation

Python 2.6/2.7/3.4/3.5/3.6/3.7 are required. macOS and recent Linux distributions should have these preinstalled.

https://docs.appdynamics.com/display/PRO45/Python+Supported+Environments

You must have `pip` and `virtualenv` installed. These may already be installed for you. If not, install `pip` with:

```
sudo easy_install pip
```

And then use `pip` to install `virtualenv`:

```
sudo pip install virtualenv
```

Create a virtualenv:

```
virtualenv python3
python3/bin/pip3 install -r requirements.txt
```

Install and configure MySQL/MariaDB, configured in `demo/config.py` to be running on localhost with the default port, a user named `test`, with password `test`, and a database named `test`. 
There do not need to be any tables or anything in the `test` database.

The web server runs on port 9000.

To run the development server:

```
python3/bin/python demo/app.py
```

To run in production:

```
python3/bin/gunicorn -w 2 -b 0.0.0.0:9000 demo.app:app
```

## Running with the agent

Then install the agent into your virtualenv:

```
python3/bin/pip3 install --pre appdynamics
```

Run the agent with the `pyagent` command and a configuration file (there's a sample configuration file included in this repository, `appdynamics.cfg`):

```
python3/bin/pyagent run -c appdynamics.cfg - env/bin/gunicorn -w 4 -b 0.0.0.0:9000 demo.app:app
```

## Generating load

```
sh -x load.sh
```

## HTTP Exit Call / Distributed Correlation Testing

The AppDynamics Python agent supports distributed correlation across tiers. The agent supports both being the originating tier and the continuing tier. To demonstrate this and test it out, you can use the `/http` endpoint to cause an HTTP exit call with a correlation header. This is useful for testing cross-tier correlation (as of 4.0.0, the Python agent does not support cross-app correlation). For example, if you have a .NET instrumented tier at 192.168.0.1, you can cause correlation by going to `http://127.0.0.1/http?url=http://192.168.0.1/`.
