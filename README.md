# mir-aio
A python MIR (Music Information Retrieval) All-In-One toolbox.
Based on https://github.com/iot-salzburg/gpu-jupyter

System requirement: Ubuntu 18.04

## Installation Guide

#### Step 0: Check your device
 - Make sure your computer is running ubuntu 18.04. (guide: https://www.linuxtechi.com/ubuntu-18-04-lts-desktop-installation-guide-screenshots/)
 - If you want to use GPU, make sure you have one. (must be NVIDIA)

#### Step 1: Install Docker
 - Run the following commands in your terminal:
```shell
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
sudo systemctl start docker
docker --version
```
 - If you see a version number printed, it's done.
  
#### Step 2: Get mir-aio image and run a container
 - Run the followin commands in your terminal:
```shell
sudo docker run -it --gpus all \
                    --name mir-aio \
                    -e JUPYTER_ENABLE_LAB=yes \
                    --mount type=bind,source=$WORK_DIR,target=/home/jovyan/workspace \
                    -p 8888:8888 -p 6006:6006 arthurgjy/mir-aio:latest
```
 - Change `$WORK_DIR` to the directory of your own files, e.g. `/home/arthur/my_workspace/`.
 - Docker will read, write all files in this folder. Docker do not have access to any other directory on your computer.
 - WARNING: If you are editing any file not in /home/jovyan/workpace, they will NOT be saved after you stop the current container.

#### Step 3: Open Jupyter lab
 - Open your browser and go to `localhost:8888`.
 - Default password is `asdf`.
 - Checkout `start_guide.ipynb` to see what can you do with mir-aio.

#### (Optional) Start tensorboard:
```
sudo docker exec -it mir-aio:latest tensorboard --logdir tf_logs/
```

### Package list

#### GPU dependencies
 - CUDA 10.1
 - cuDNN 7

#### Ubuntu packages
 - sox
 - libasound-dev
 - libjack-dev
 - fluidsynth

#### MIR related
 - librosa
 - mir_eval
 - mirdata
 - sox
 - jams
 - madmom
 - prettyMIDI
 - music21
 - magenta
 - muspy (new!)
 <!-- - ddsp -->

#### ML related
 - scipy
 - scikit-learn
 - tensorflow==2.3.1
 - pytorch

#### Utilities
 - Jupyter notebook & lab
 - pandas
 - numpy
 - matplotlib
 - IPython
 - requests
 - tqdm
 - pickle
 - pandoc