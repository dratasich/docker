FROM ros:kinetic

SHELL ["/bin/bash", "-c"]

# p2os to understand robot messages
# git to download custom ROS packages
RUN apt-get update && apt-get install -y \
        python-serial \
        ros-kinetic-serial \
        ros-kinetic-tf2-ros \
        git

# install and build ydlidar ROS driver
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws/src
# get ydlidar driver
ADD https://api.github.com/repos/EAIBOT/ydlidar/compare/master...HEAD /dev/null
RUN git clone https://github.com/EAIBOT/ydlidar.git
# overwrite lidar launch file (add arguments for launch, fix tf)
COPY lidar.launch /catkin_ws/src/ydlidar/launch/lidar.launch
# build
WORKDIR /catkin_ws
RUN source /opt/ros/kinetic/setup.bash && catkin_make

# initialize ROS (master uri, environments, etc.)
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# default command
CMD ["bash"]
