#!/bin/bash

# exit immediately if a command exits with a non-zero status (see `$ help set`)
set -e

ECHO_PREFIX="[docker-entrypoint.sh]"

# location of master
export ROS_MASTER_URI=http://nils:11311/
echo "$ECHO_PREFIX" "set ROS master: " "$ROS_MASTER_URI"

# ROS installation
ROS=/opt/ros/kinetic/setup.bash
source "$ROS"
echo "$ECHO_PREFIX" "sourced ROS installation:" "$ROS"

# workspace holding custom ROS packages
workspace=/catkin_ws
source "$workspace"/devel/setup.bash
echo "$ECHO_PREFIX" "sourced workspace:" "$workspace"

# set python path
export PYTHONPATH=/python_ws/shsa-prolog/:/usr/lib/python2.7/dist-packages/:$PYTHONPATH
echo "$ECHO_PREFIX" "set python paths:" $PYTHONPATH

echo "$ECHO_PREFIX" "execute" "$@"
exec "$@"
