FROM cschranz/gpu-jupyter:latest

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

# Install Linux packages
USER root
## Delete nvidia apt source, which reports error occasionally.
RUN rm /etc/apt/sources.list.d/nvidia-ml.list && rm /etc/apt/sources.list.d/cuda.list && apt-get clean
## Use aliyun source if you are in China.
# RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt-get update && sudo apt-get  install -y \ 
                                            sox \
                                            libasound-dev \
                                            libjack-dev \
                                            fluidsynth
USER $NB_USER

## Uninstall pip packages
RUN pip install --upgrade pip \
    ## Use aliyun source if you are in China.
    # -i https://mirrors.aliyun.com/pypi/simple/ \
    && \
    pip uninstall -y \
    'tensorflow-gpu'

## Install pip packages
RUN pip install --no-cache-dir\
    ## Use aliyun source if you are in China.
    # -i https://mirrors.aliyun.com/pypi/simple/ \
    ## fix tensorflow version
    'tensorflow==2.3.1' \
    # 'pytorch==1.6.0' \
    'mirdata' \
    'mir_eval' \
    'sox' \
    'mido==1.2.6' \
    'madmom' \
    'librosa==0.7.2' \
    'music21' \
    ## ddsp is having some issue when installing crepe
    # 'ddsp==0.13.1' \
    'muspy' \
    ## magenta dependencies
    'magenta' \
    'protobuf>=3.12.0' \
    'google-auth>=1.21.1' \
    'gast' \
    'absl-py' \
    'tensorflow-probability==0.7.0' \
    'tensorflow-addons' \
    'note_seq'
    # fix-permissions $CONDA_DIR && \
    # fix-permissions /home/$NB_USER

## Install conda packages
# RUN conda update -n base conda && \
#     conda install --yes \
#     'ipython' \
#     'imageio' \
#     'pandoc' \
#     'requests' \
#     && \
#     conda clean --all -f -y

## copy the guide notebook
COPY src/start_guide.ipynb /home/$NB_USER