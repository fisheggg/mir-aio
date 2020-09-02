ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

# Install Linux packages
USER root
RUN apt-get update && sudo apt-get  install -y sox
USER $NB_USER

############################################################################
############################   MIR packages  ###############################
############################################################################

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

# Install Linux packages
USER root
RUN apt-get update && sudo apt-get  install -y sox libasound-dev libjack-dev
USER $NB_USER

# Install pip packages, using douban image
RUN pip install --upgrade pip -i https://pypi.douban.com/simple/ &&\
    pip install -i https://pypi.douban.com/simple/ \
    'mirdata==0.1.2' \
    'mir_eval==0.5' \
    'tensorflow==2.1.0' \
    'sox==1.3.7' \
    'Cython==0.29.15' \
    'mido==1.2.6' \
    'madmom==0.16.1' \
    'librosa==0.7.2' \
    # 'ddsp==0.0.9' \
    'magenta==2.1.1' \
    # magenta dependencies
    'protobuf>=3.12.0' \
    'google-auth>=1.16.0' \
    'gast>=0.3.2' \
    'absl-py<0.9,>=0.7' \
    'tensorflow-probability==0.7.0' \
    && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Install conda packages
RUN conda update -n base conda &&
    conda install --yes \
    'ipython' \
    'imageio' \
    'matplotlib' \
    'pandas' \
    'pandoc' \
    'requests' \
    'scikit-image' \
    'scikit-learn' \
    'scipy' \
    && \
    conda clean --all -f -y
