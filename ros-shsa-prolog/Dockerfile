FROM ros:kinetic

SHELL ["/bin/bash", "-c"]

# messages needed for demos
RUN apt-get update && apt-get install -y \
        ros-kinetic-p2os-msgs \
        ros-kinetic-tf2-ros \
        ros-kinetic-gmapping \
        ros-kinetic-navigation \
        python-pip \
        git

# python ws: shsa-prolog
RUN mkdir -p /python_ws
WORKDIR /python_ws
# shsa-prolog source
ADD https://api.github.com/repos/dratasich/shsa-prolog/compare/master...HEAD /dev/null
RUN git clone https://github.com/dratasich/shsa-prolog.git
# install dependencies
WORKDIR /python_ws/shsa-prolog
RUN pip install -r requirements.txt

# catkin ws: custom ROS packages
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws/src
# some more packages for messages
ADD https://api.github.com/repos/tuw-cpsg/general-ros-modules/compare/master...HEAD /dev/null
RUN git clone https://github.com/tuw-cpsg/general-ros-modules.git
# ROS wrapper for shsa
ADD https://api.github.com/repos/dratasich/shsa_ros/compare/master...HEAD /dev/null
RUN git clone https://github.com/dratasich/shsa_ros.git
# build catkin ws
WORKDIR /catkin_ws
RUN source /opt/ros/kinetic/setup.bash && catkin_make

# initialize ROS (master uri, environments, etc.)
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# default command
CMD ["bash"]
