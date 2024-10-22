FROM ros:noetic-ros-core
RUN useradd -m robm -G sudo -s /bin/bash 
WORKDIR /home/robm
SHELL ["/bin/bash", "-c"] 
RUN echo "robm:thymio" | chpasswd

RUN apt-get update && apt-get install -y python3-venv git ros-noetic-foxglove-bridge nano

USER robm
RUN python3 -m venv ~/venv/venv_robm
RUN ~/venv/venv_robm/bin/pip install thymiodirect
RUN echo "source ./venv/venv_robm/bin/activate" >> ~/.bashrc

