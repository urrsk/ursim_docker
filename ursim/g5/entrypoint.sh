#!/bin/bash

export DISPLAY=:1
export ROBOT_MODEL

Xvfb :1 -screen 0 1280x800x16 &
x11vnc -bg -quiet -forever -shared -display :1

# Execute URSim
/ursim/start-ursim.sh ${ROBOT_MODEL}