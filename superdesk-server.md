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

In the next part of the series we will dive into the details of the abstractions introduced in order to make this architecture
play nicely with Eve and Celery.

Develop with passion - Adrian
