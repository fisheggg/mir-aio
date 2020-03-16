ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Arthur Jinyue Guo <jg5505@nyu.edu>"

# Install Linux packages
USER root
RUN apt-get update && sudo apt-get  install -y sox
USER $NB_USER

# Install pip packages
RUN pip install --upgrade pip &&\
    pip install --quiet \
    'mirdata==0.1.2' \
    'mir_eval==0.5' \
    'tensorflow==2.1.0' \
    'sox==1.3.7' \
    'Cython==0.29.15' \
    'mido==1.2.9' \
    'madmom==0.16.1' \
    'librosa==0.7.2' \
    'ddsp==0.0.9' \
    && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER


# Install conda packages
RUN conda install --quiet --yes \
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



# Instal source packages (madmom)
# RUN git clone  https://github.com/CPJKU/madmom.git && \
#     cd madmom && \
#     git submodule update --init --remote && \
#     python setup.py develop --user

