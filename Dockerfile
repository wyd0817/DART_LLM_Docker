# ------------ Base Image File
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

    
# ------------ Environment Settings
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs
ENV DISPLAY host.docker.internal:0.0
ENV PULSE_SERVER=tcp:host.docker.internal:4713
ENV DEBIAN_FRONTEND=noninteractive

# ------------ Time Zone Settings
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo 

# ------------ Working Directory Settings
WORKDIR /root

# ------------ Environment Setup on Ubuntu
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip

# Install x11-apps required for connecting to x-server on Windows
RUN apt-get install x11-apps -y

# Install git (not installed by default on 20.04 and later)
RUN apt-get install git -y

# Required for GUI drawing in matplotlib, etc.
RUN apt-get install python3-tk -y

# Install libraries for PyTorch
RUN pip3 install torch torchvision

# ------------ ROS2 Setup
COPY setup.sh /root/
RUN bash ~/setup.sh

# ------------ LLM Setup
RUN pip install wandb datasets tqdm tiktoken transformers deepspeed openai PyYAML accelerate datasets einops evaluate peft protobuf scikit-learn scipy sentencepiece fire mpi4py
RUN pip install bs4 zenhan mecab-python3 pyknp
RUN pip install langchain sentence_transformers faiss-gpu python-dotenv

# ------------ Jupyter Setup
RUN pip install ipykernel jupyter jupyterlab

# CLIP GradCAM Colab
RUN pip install ftfy regex tqdm matplotlib opencv-python scipy scikit-image
RUN pip install git+https://github.com/openai/CLIP.git
RUN pip install gradio

# ------------ ros2 navigation Setup
RUN apt update -y
RUN apt install -y ros-humble-navigation2 ros-humble-nav2-bringup
