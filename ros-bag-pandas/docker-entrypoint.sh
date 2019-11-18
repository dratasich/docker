#!/bin/bash

# exit immediately if a command exits with a non-zero status (see `$ help set`)
set -e

ECHO_PREFIX="[docker-entrypoint.sh]"

# ROS installation
ROS=/opt/ros/kinetic/setup.bash
source "$ROS"
echo "$ECHO_PREFIX" "sourced ROS installation:" "$ROS"

# workspace holding custom ROS packages
workspace=/catkin_ws
source "$workspace"/devel/setup.bash
echo "$ECHO_PREFIX" "sourced workspace:" "$workspace"

# set python path
export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages/
echo "$ECHO_PREFIX" "set python paths:" $PYTHONPATH

echo "$ECHO_PREFIX" "execute" "$@"
exec "$@"
