FROM cschranz/gpu-jupyter:v1.4_cuda-11.0_ubuntu-20.04_python-only

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

# Install Linux packages
USER root
## Delete nvidia apt source, which reports error occasionally.
RUN rm /etc/apt/sources.list.d/nvidia-ml.list && rm /etc/apt/sources.list.d/cuda.list && apt-get clean
## Use aliyun source if you are in China.
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt-get update && sudo apt-get  install -y \ 
                                            sox \
                                            libasound-dev \
                                            libjack-dev \
                                            fluidsynth
USER $NB_USER

## Uninstall pip packages
# RUN pip install --upgrade pip \
    ## Use aliyun source if you are in China.
    # -i https://mirrors.aliyun.com/pypi/simple/ \
    # && \
    # pip uninstall -y \
    # 'tensorflow-gpu'

## Install conda packages
RUN conda update -n base conda

# RUN conda install -y \
#     numba \
#     pytorch=1.8.1 \
#     torchvision \
#     torchaudio \
#     'ipython' \
#     'imageio' \
#     pandoc \
#     'requests' \
#     -c pytorch -c conda-forge \
#     && \
#     conda clean --all -f -y

## Install pip packages
RUN pip install --no-cache-dir\
    ## Use aliyun source if you are in China.
    # -i https://mirrors.aliyun.com/pypi/simple/ \
    'pytorch-lightning' \
    'mirdata' \
    'mir_eval' \
    'sox' \
    'mido==1.2.6' \
    # 'madmom' \
    'librosa' \
    'music21' \
    ## ddsp is having some issue when installing crepe
    # 'ddsp' \
    'muspy'
    ## magenta dependencies
    # 'magenta' \
    # 'protobuf>=3.12.0' \
    # 'google-auth>=1.21.1' \
    # 'gast' \
    # 'absl-py' \
    # 'tensorflow-probability==0.7.0' \
    # 'tensorflow-addons' \
    # 'note_seq'

# # Remove r packages
# RUN conda remove -qy \
#     'r-base'  \
#     'r-caret' \
#     'r-crayon' \
#     'r-devtools' \
#     'r-forecast' \ 
#     'r-hexbin' \
#     'r-htmltools' \
#     'r-htmlwidgets' \ 
#     'r-irkernel' \
#     'r-nycflights13' \
#     'r-randomforest' \
#     'r-rcurl' \
#     'r-rmarkdown' \
#     'r-rsqlite' \
#     'r-shiny' \
#     'r-tidyverse' \
#     'rpy2'

# RUN conda update -qy \
#     torchvision \
#     pytorch \
#     -c pytorch \
#     && \
#     conda clean --all -f -y

## copy the guide notebook
COPY src/start_guide.ipynb /home/$NB_USER
