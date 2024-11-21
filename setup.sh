#!/bin/bash -e 

# ------------ Adding apt-get repositories
apt-get install curl gnupg lsb-release -y
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# ------------ Adding repository to source list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# ------------ Installing ROS2
apt-get update
apt-get install ros-humble-desktop -y

# ------------ Setting up environment
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# ------------ Installing rosdep
apt-get install -y python3-rosdep
rosdep init
rosdep update

# ------------ Creating workspace
apt-get install python3-colcon-common-extensions -y
mkdir -p ~/share/ros2_ws/src
cd ~/share/ros2_ws/ && colcon build

# ------------ Installing Gazebo
apt-get install gazebo -y
apt-get install ros-humble-gazebo-* -y

# ------------ Reflecting environment settings
echo "source ~/share/ros2_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc