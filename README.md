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

## More info

More info at [hub.docker.com](https://hub.docker.com/r/universalrobots/ursim_e-series)
