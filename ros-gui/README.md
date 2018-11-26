Dockerfile to Start ROS GUI Tools
=================================

Official [ROS docker images](https://hub.docker.com/_/ros/) do not include the desktop tools.
Here are the instructions to start ROS GUI tools.


Build
-----

Build the docker image (see `docker-build(1)`):
```bash
$ cd <path-to>/docker/ros-gui
$ docker build -t ros:gui .
```

Install [x11docker](https://github.com/mviereck/x11docker) to run GUI apps properly.


Usage
-----

```bash
x11docker --hostnet ros:gui rqt_graph
```
Replace `rqt_graph` with the ROS GUI of your choice.
