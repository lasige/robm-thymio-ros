# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
#FROM fculrobotics:robm_lab

FROM ros:noetic-ros-core
WORKDIR /home/ubuntu/robm
RUN chown ubuntu /home/ubuntu/robm

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    python3-catkin \    
    python3-rosdep 
    #&& rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# setup colcon mixin and metadata
RUN colcon mixin add default \
      https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml && \
    colcon mixin update && \
    colcon metadata add default \
      https://raw.githubusercontent.com/colcon/colcon-metadata-repository/master/index.yaml && \
    colcon metadata update

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-jazzy-ros-base=0.11.0-1* 
  
RUN apt-get update && apt-get install -y python3-venv 
USER ubuntu
RUN python3 -m venv /home/ubuntu/robm/.venv_robm
RUN /home/ubuntu/robm/.venv_robm/bin/pip install thymiodirect
#RUN pipx install pyserial thymiodirect
CMD ["/bin/bash", "-c", "source .venv_robm/bin/activate"]
#RUN source .venv_robm/bin/activate
#RUN python3 -m pip install thymiodirect

ENTRYPOINT ["bash","/ros_entrypoint.sh"]

