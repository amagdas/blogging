## Superdesk server architecture overview

The [Superdesk](https://github.com/superdesk/superdesk) open source project is built
following the REST architecture, the client is an Angular driven application and the backend is being built
using Python 3 and the Flask based [Eve framework](http://python-eve.org).

This post will do a deep dive on the backend side of the current architecture, the client side will be tackled by an upcoming post.

### Tech stack

- [Python 3](https://docs.python.org/3/) - provides all the goodies to make devs happy
- [Eve](http://python-eve.org) - easy way to define the REST style API
- [Flask](http://flask.pocoo.org/) - besides being the backbone for Eve, we use it extensively for creating custom commands
- [Mongo](www.mongodb.org) - main data storage
- [Elastic](www.elastic.co) - secondary data storage, enhanced search capabilities
- [Celery](http://www.celeryproject.org/) - task distribution, workhorse for background data processing
- [Redis](http://www.redis.io/) - mainly used for passing data to Celery workers and for task synchronization
- [Autobahn](http://autobahn.ws/python/) - WebSocket communication handling, main notification mechanism
- [Honcho](https://pypi.python.org/pypi/honcho) - manage the running applications

Optional dependencies:
- [Docker](https://www.docker.com/) - custom built images for server and client, easy run&deploy scenarios
- [LogStash](https://www.elastic.co/products/logstash) - centralized logging

The full list of development dependencies can be found [here](https://github.com/superdesk/superdesk/blob/master/server/requirements.txt)

### Overview
![Architecture overview](https://github.com/amagdas/blogging/blob/master/Superdesk_server_diagram.png)

What's visible at a quick glance is that the current backend infrastructure is comprised of 3 running apps:
- Flask/Eve web application running on top of [Gunicorn](http://gunicorn.org/)
- Celery application  sharing a lot of the internal infrastructure of the Eve application
- WebSocket server to handle client notifications

On the storage side of things, we have:
- Mongo as the main storage engine
- Elastic as the main search engine
- Redis for sending data to and from Celery workers

In the next parts of the series we will dive into the following topics:
- the details of the abstractions introduced in order to make Celery workers use the same services for business logic handling
as Eve application
- challenges on how to keep data consistent between Mongo and Elastic and possible solutions
- ways to introduce new apps into the mix
- extensibility points for Superdesk as a platform

See you next time and develop with passion,  
Adrian
