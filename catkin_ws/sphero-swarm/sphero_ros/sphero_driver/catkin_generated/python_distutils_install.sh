#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/kchaudhari/catkin_ws/src/sphero-swarm/sphero_ros/sphero_driver"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/usr/local/lib/python2.7/dist-packages:/home/kchaudhari/catkin_ws/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/kchaudhari/catkin_ws" \
    "/usr/bin/python" \
    "/home/kchaudhari/catkin_ws/src/sphero-swarm/sphero_ros/sphero_driver/setup.py" \
    build --build-base "/home/kchaudhari/catkin_ws/sphero-swarm/sphero_ros/sphero_driver" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/usr/local" --install-scripts="/usr/local/bin"
