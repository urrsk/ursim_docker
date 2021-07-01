# Ursim docker

This repo hosts Dockerfiles for the ursimulator. These dockerfiles are hosted as
images on Docker Hub. These images are taged with the official release of the ursimulator
that the dockerfile builds.

The container sets up a VNC server and exposes a port in which you can access the
robots GUI to control the robot. It also exposes all other available interfaces
that you can control the robot.

There is two different versions of the simulator a e-series robot and CB-series.
There is images for both CB-series and e-series. E-series is taged with 5 first
and CB-series with 3 first.

You can find the image on [Docker Hub](https://hub.docker.com/repository/docker/mahp2502/ursim_docker/general).

**Disclaimer** The docker image is primarily created to be used inside test pipelines
on GitHub. It can also be used as an alternative to the virtual machine solution
however there is no guaranties that the docker image will work as expected.

## How to use this image

First you should go ahead and pull the docker image of the version you want to use.
For that following command can be used.

```bash
docker pull mahp2502/ursim_docker:tagname
```

When the image has been pulled you can go ahead and run the image with the following
command.

```bash
docker run --rm -it -p 5900:5900 -p 29999:29999 -p 30001-30004:30001-30004 mahp2502/ursim_docker:tagname
```

Now you can use a VNC application to view the robots GUI, by connecting to localhost:5900.
And you will have a fully functional simulator which can be used inside applications
or testing pipelines.

This is just example to get you started, to see all available parameters see below.

## Parameters

You can use the container with the different parameters, all parameters available
can be seen below.

| Parameter               | Description |
| ---                     | ---                                                                                                                            |
| `-e ROBOT_MODEL=UR5`    | Specify robot model to simulate. Valid options are UR3, UR5 and UR10. Defaults to UR5.                                         |
|`-e TZ=Europe/Copenhagen`|  Specify a timezone to use. Defaults to Europe/Copenhagen                                                                      |
| `-p 5900`               | Allows VNC access to the robots interface                                                                                      |
| `-p 502`                | Allows access to Universal Robots Modbus port.                                                                                 |
| `-p 29999`              | Allows access to Universal Robots dashboard server interface port.                                                             |
| `-p 30001`              | Allows access to Universal Robots primary interface port.                                                                      |
| `-p 30002`              | Allows access to Universal Robots secondary interface port.                                                                    |
| `-p 30003`              | Allows access to Universal Robots real-time interface port.                                                                    |
| `-p 30004`              | Allows access to Universal Robots RTDE interface port.                                                                         |
|`-v /ursim/programs`     | The UR programs directory, this enables the possibility to save robot programs in between docker runs, see documentation below |

### Volume

The `/ursim/programs` is used for storing robot programs created during using the
robot. If you wish to persist these files beyond the lifecycle of the container,
the `/ursim/programs` can be mounted to an external volume on the host. This will
enable the possibility to store robot programs in between runs and this could also
be used to parse urcaps and old programs to the simulator.

For example, if one wishes to use their own programs folder that already resides
in their local home directory, with a username of "user", we can simply launch the
container with an additional volume argument:

```bash
docker run -v "/home/user/programs:/ursim/programs"
```
