sudo docker run --gpus all --rm --name mir-aio -e JUPYTER_ENABLE_LAB=yes --mount type=bind,source=/mnt/d/ubuntu/Workspace,target=/home/jovyan/workspace -p 8888:8888 -p 6006:6006 arthurgjy/mir-aio:latest &

