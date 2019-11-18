FROM ros:kinetic

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
        python-matplotlib \
        python-pandas \
        python-pip \
        git

# additional python packages (not in ubuntu repository)
RUN pip install \
        flatdict

# install rosbag_pandas (a ROS package) and dependencies
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws/src

ADD https://api.github.com/repos/eurogroep/rosbag_pandas/compare/master...HEAD /dev/null
RUN git clone https://github.com/eurogroep/rosbag_pandas.git

ADD https://api.github.com/repos/uos/rospy_message_converter/compare/master...HEAD /dev/null
RUN git clone https://github.com/uos/rospy_message_converter.git

# install custom ROS packages (to understand its messages)
ADD https://api.github.com/repos/tuw-cpsg/general-ros-modules/compare/master...HEAD /dev/null
RUN git clone https://github.com/tuw-cpsg/general-ros-modules.git

ADD https://api.github.com/repos/dratasich/shsa_ros/compare/master...HEAD /dev/null
RUN git clone https://github.com/dratasich/shsa_ros.git

# build custom ROS packages
WORKDIR /catkin_ws
RUN source /opt/ros/kinetic/setup.bash && catkin_make

# initialize ROS (master uri, environments, etc.)
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# default command
CMD ["bash"]
