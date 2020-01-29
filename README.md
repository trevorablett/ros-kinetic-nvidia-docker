# ros-kinetic-nvidia-docker - turtlebot3 branch
Extends ros-kinetic-nvidia-docker to make it easy to get up and running with turtlebot3.

As it stands, the users home directory is shared with the container (which may not be necessary).

Any files in the catkin_ws_src folder are shared with the container at /kinetic_catkin_ws/src.

# Installation
1. Install docker.
2. Add user to docker group (see https://docs.docker.com/install/linux/linux-postinstall/)
3. Install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker).
4. Run `sh build-image.sh` to build the image.
5. Run `sh new-container.sh` to create and enter a new container.
6. To join an existing container from another terminal, use `sh attach-to-container.sh`.
7. You will probably want to add lines resembling those in `example_bashrc` to your bashrc (until we remove sharing of the home directory).

# Use
Once inside the container (at `/kinetic_catkin_ws'), run `catkin_make` to build the turtlebot packages, and `source devel/setup.bash`. To test out the installation, run
```
roslaunch turtlebot3_fake turtlebot3_fake.launch
```
and you should see an Rviz window with the turtlebot3 come up.