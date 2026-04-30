# URSim docker with the latest external control URCap

This repo is using Universal Robots URSim docker available at [hub.docker.com](https://hub.docker.com/r/universalrobots/ursim_e-series) and install the latest released external_control URCap from [github](https://github.com/UniversalRobots/Universal_Robots_ExternalControl_URCap) as well.


## How to use this image

Build example:

```bash
docker build -t myursim --build-arg VERSION=latest .
```

Run example:

```bash
docker run --rm -it -p 5900:5900 -p 29999:29999 -p 30001-30004:30001-30004 myursim
```

## Run in WSL2; access URsim from Windows Web Browser

URsim Docker can be run in WSL without Docker Desktop. Launching the container is the same as above. 

Accessing the VNC requires 
1) forwarding ports from windows to WSl
AND
2) launch the container with port forwards from WSL (docker Host) to the container

### 1) forwarding ports from windows to WSl

See here: https://learn.microsoft.com/en-us/windows/wsl/networking#accessing-a-wsl-2-distribution-from-your-local-area-network-lan

Per the Microsoft link above, run the following to add a portproxy port forward from windows to wsl. For example: the following command forwards port 6080 for the web-VNC client:
```bash
netsh interface portproxy add v4tov4 listenport=6080 listenaddress=0.0.0.0 connectport=6080 connectaddress=(wsl hostname -I)
```
Replace 6080 with 5900 if using a VNC client instead of the No-VNC web client. Or repeat the above for each port.

you can view the current portproxy rules and the one you just created with:
```bash
netsh interface portproxy show all
```

__NOTE__: You may need to add a firewall rule to windows firewall allowing connections to this port as well

### 2) Launch the container with port forwards:
```bash
docker run --rm -it -p 5900:5900 -p 6080:6080 universalrobots/ursim_e-series
```
Identify WSL Distro IP address. From your WSL terminal, run `ifconfig`, and find your WSL IP (typically `eth0`)
Access the web-vnc client in a browser at http://[__*WSL Distro IP*__]:6080

## More info

More info at [hub.docker.com](https://hub.docker.com/r/universalrobots/ursim_e-series)
