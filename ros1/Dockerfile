# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
#FROM fculrobotics:robm_lab
#FROM ubuntu:focal
FROM ros:noetic-ros-core
RUN useradd -m ubuntu -s /bin/bash 

WORKDIR /home/ubuntu/robm

RUN chown ubuntu /home/ubuntu/robm

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# setup keys
RUN set -eux; \
       key='C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654'; \
       export GNUPGHOME="$(mktemp -d)"; \
       gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
       mkdir -p /usr/share/keyrings; \
       gpg --batch --export "$key" > /usr/share/keyrings/ros1-latest-archive-keyring.gpg; \
       gpgconf --kill all; \
       rm -rf "$GNUPGHOME"

# setup sources.list
RUN echo "deb [ signed-by=/usr/share/keyrings/ros1-latest-archive-keyring.gpg ] http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list

# setup environment
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

ENV ROS_DISTRO=noetic

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends\
    ros-noetic-base=1.5.0-1* \
    python3-catkin-tools
# setup entrypoint
#COPY ./ros_entrypoint.sh /


RUN apt-get update && apt-get install -y python3-venv 
USER ubuntu
RUN python3 -m venv /home/ubuntu/robm/.venv_robm
RUN /home/ubuntu/robm/.venv_robm/bin/pip install thymiodirect
#RUN pipx install pyserial thymiodirect
SHELL ["/bin/bash", "-c"] 

RUN source .venv_robm/bin/activate
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc


#RUN source .venv_robm/bin/activate
#RUN python3 -m pip install thymiodirect

#ENTRYPOINT ["bash","/ros_entrypoint.sh"]

