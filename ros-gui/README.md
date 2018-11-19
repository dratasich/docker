Dockerfile to Start ROS GUI Tools
=================================

Official [ROS docker images](https://hub.docker.com/_/ros/) do not include the desktop tools.
Here are the instructions to start ROS GUI tools.


Build
-----

Build the docker image (see `docker-build(1)`):
```bash
$ cd <path-to>/docker/ros-gui
$ docker build -t ros:kinetic-desktop-full .
```

You may create an alias for convinience (in `.bashrc` or similar):
```bash
alias ros_gui="docker run --net=host --user $(id -u) --env DISPLAY=$DISPLAY -v '/tmp/.X11-unix:/tmp/.X11-unix:rw'"
```


Usage
-----

So you can later start a ROS GUI tool by:
```bash
$ ros_gui --name rqt_graph ros:kinetic-desktop-full rqt_graph
```

You can then (re-)start `rqt_graph` by:
```bash
$ docker start rqt_graph
```
