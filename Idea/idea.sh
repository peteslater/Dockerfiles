#!/bin/bash

xhost local:root
sudo docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -it peteslater/idea
