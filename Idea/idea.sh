#!/bin/bash

xhost local:root
sudo docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -v ~/.IdeaIC2017.1:/root/.IdeaIC2017.1 -it peteslater/idea
