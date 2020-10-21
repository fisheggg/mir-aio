# mir-aio
A python MIR (Music Information Retrieval) All-In-One toolbox.
Based on https://hub.docker.com/r/cschranz/gpu-jupyter/dockerfile.

System requirement: Ubuntu 18.04

### Usage
#### Start Jupyter Lab:

Default password of Jupyter:asdf

Run the following command in shell:
```
sudo docker run -it --gpus all \
                           --name mir-aio \
                           -e JUPYTER_ENABLE_LAB=yes \
                           --mount type=bind,source=$WORK_DIR,target=/home/jovyan/workspace \
                           -p 8888:8888 -p 6006:6006 arthurgjy/mir-aio:latest
```
Change `$WORK_DIR` to the directory of your own files.


#### Start tensorboard:
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
 - tensorflow
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