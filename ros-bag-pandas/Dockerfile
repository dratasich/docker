FROM ros:kinetic

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
        python-pip \
        python-pandas \
        python-gnupg

# additional python packages (not in ubuntu repository)
RUN pip install \
        pyyaml \
        pycrypto \
        rosbag_pandas

# initialize ROS (master uri, environments, etc.)
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# default command
CMD ["bash"]
