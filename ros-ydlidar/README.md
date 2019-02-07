Dockerfile to Run YDLIDAR ROS Driver
====================================

Image to run the ROS driver of YDLIDAR X4 from EAIBOT.


Build
-----

Build the docker image (see `docker-build(1)`):
```bash
$ cd <path-to>/docker/ros-ydlidar
$ docker build -t ros:ydlidar .
```


Usage
-----

```bash
$ docker run --rm -it --network=host --device=/dev/ttyUSB0 ros:ydlidar roslaunch ydlidar lidar.launch port:=/dev/ttyUSB0
[docker-entrypoint.sh] set ROS master:  http://nils:11311/
[docker-entrypoint.sh] sourced ROS installation: /opt/ros/kinetic/setup.bash
[docker-entrypoint.sh] sourced workspace: /catkin_ws
[docker-entrypoint.sh] execute bash
...
```

Check topic with `docker run --rm -it --network=host ros:kinetic rostopic echo /scan`.

If you want to re-start the container later,
you have to remove the option `--rm`
(and replace it with `--name ydlidar` for convenience)
from the `docker-run(1)` command above.
When you `docker-exec(1)` you have to call `source /docker-entrypoint.sh` first.
