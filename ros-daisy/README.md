Dockerfile to Start ROS and Demos with Daisy
============================================

Custom image to work with [Daisy].


Build
-----

Build the docker image (see `docker-build(1)`):
```bash
$ cd <path-to>/docker/ros-daisy
$ docker build -t ros:daisy .
```

[Network setup] with [Daisy] (install `openssh-server`, exchange SSH keys).


Usage
-----

```bash
$ docker run --rm -it --network=host -v /home/denise/.ssh/:/root/.ssh/ ros:daisy roslaunch pioneer_teleop drive.launch notebook:=<your hostname>
[docker-entrypoint.sh] set ROS master:  http://<your hostname>:11311/
[docker-entrypoint.sh] sourced ROS installation: /opt/ros/kinetic/setup.bash
[docker-entrypoint.sh] sourced workspace: /catkin_ws
[docker-entrypoint.sh] execute roslaunch pioneer_teleop drive.launch notebook:=<your hostname>
...
```

You need the ssh folder to spawn ROS nodes on [Daisy].
For nodes you want to run on your notebook (see also launch files without machine specs) you can omit the `-v` option.
Note, `--network=host` enables the container to use the host's network (e.g., spy on it)!

If you want to re-start the container later,
you have to remove the option `--rm`
(and replace it with `--name daisy` for convenience)
from the `docker-run(1)` command above.
When you `docker-exec(1)` you have to call `source /docker-entrypoint.sh` first.


[Daisy]: https://tuw-cpsg.github.io/tutorials/daisy/
[network setup]: https://tuw-cpsg.github.io/tutorials/dagobert-network-setup.html
