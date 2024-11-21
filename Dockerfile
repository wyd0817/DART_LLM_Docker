# ------------ Base Image
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

    
# ------------ Environment Settings
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs
ENV DISPLAY host.docker.internal:0.0
ENV PULSE_SERVER=tcp:host.docker.internal:4713
ENV DEBIAN_FRONTEND=noninteractive

# ------------ Set Timezone
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo 

# ------------ Set Working Directory
WORKDIR /root

# ------------ Build Environment on Ubuntu
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip

# Install x11-apps (Required for connecting to X-server on Windows)
RUN apt-get install x11-apps -y

# Install git (Not installed by default on Ubuntu 20.04 and later)
RUN apt-get install git -y

# Required for GUI rendering (e.g., with matplotlib)
RUN apt-get install python3-tk -y

# Install libraries required for PyTorch
RUN pip3 install torch torchvision

# ------------ Jupyter Setup
RUN pip3 install ipykernel jupyter jupyterlab

# ------------ Setup for ROS2 and Navigation2
COPY setup.sh /root/
RUN bash ~/setup.sh

# ------------ Install LLM-related Libraries
RUN pip3 install \
    wandb datasets tqdm tiktoken transformers deepspeed openai PyYAML accelerate \
    einops evaluate peft protobuf scikit-learn scipy sentencepiece fire \
    bs4 zenhan mecab-python3 pyknp \
    langchain sentence_transformers faiss-gpu python-dotenv \
    ipykernel jupyter jupyterlab \
    numpy==1.26.4 scipy==1.8.0 transforms3d==0.4.2 \
    gradio loguru \
    langchain_openai langchain_anthropic langchain_groq \
    SpeechRecognition

# ------------ Install CLIP GradCAM
RUN pip3 install ftfy regex tqdm matplotlib opencv-python scipy scikit-image
RUN pip3 install git+https://github.com/openai/CLIP.git

