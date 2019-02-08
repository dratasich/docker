FROM ros:melodic

SHELL ["/bin/bash", "-c"]

# ros desktop full for GUIs
# p2os to understand robot messages
RUN apt-get update && apt-get install -y \
        ros-melodic-desktop-full \
        ros-melodic-p2os-msgs \
        git

# install custom ROS packages (to understand its messages)
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws/src
ADD https://api.github.com/repos/tuw-cpsg/general-ros-modules/compare/master...HEAD /dev/null
RUN git clone https://github.com/tuw-cpsg/general-ros-modules.git

# build custom ROS packages
WORKDIR /catkin_ws
RUN source /opt/ros/melodic/setup.bash && catkin_make

# initialize ROS (master uri, environments, etc.)
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# default command
CMD ["bash"]
