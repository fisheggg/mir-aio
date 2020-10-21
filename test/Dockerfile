FROM cschranz/gpu-jupyter:latest

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

# Install Linux packages
USER root
RUN apt-get update && sudo apt-get  install -y \ 
                                            sox \
                                            libasound-dev \
                                            libjack-dev \
                                            fluidsynth
USER $NB_USER

# Install pip packages, using douban image
RUN pip install --upgrade pip -i https://pypi.douban.com/simple/ &&\
    pip install -i https://pypi.douban.com/simple/ \
    'mirdata==0.1.2' \
    'mir_eval==0.5' \
    'sox==1.3.7' \
    'mido==1.2.6' \
    'madmom==0.16.1' \
    'librosa==0.7.2' \
    'music21==6.1.0' \
    'ddsp==0.0.9' \
    'muspy==0.1.0' \
    # magenta dependencies
    'magenta==2.1.1' \
    'protobuf>=3.12.0' \
    'google-auth>=1.16.0' \
    'gast==0.2.2' \
    'absl-py<0.9,>=0.7' \
    'tensorflow-probability==0.7.0' \
    'tensorflow-addons==0.9.1' \
    'scipy==1.4.1' \
    'note_seq==0.0.1' \
    && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Install conda packages
RUN conda update -n base conda && \
    conda install --yes \
    'ipython' \
    'imageio' \
    'pandoc' \
    'requests' \
    && \
    conda clean --all -f -y