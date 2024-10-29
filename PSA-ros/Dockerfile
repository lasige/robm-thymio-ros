FROM osrf/ros:noetic-desktop-full
SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y git nano mlocate python3-catkin-tools ros-noetic-effort-controllers python3-pyqtgraph ros-noetic-rqt-controller-manager
RUN mkdir -p /ros/src
RUN cd /ros/src && git clone https://github.com/lasige/robm-thymio-ros.git
RUN source /opt/ros/noetic/setup.bash && cd /ros && catkin init 
#RUN echo "source /ros_entrypoint.sh" >> /root/.bashrc
