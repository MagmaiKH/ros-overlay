# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/visualization_rwt-release/archive/release/indigo/rwt_moveit/0.0.3-1.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/interactive_marker_proxy
    ros-indigo/kdl_parser
    ros-indigo/message_runtime
    ros-indigo/moveit_msgs
    ros-indigo/orocos_kdl
    ros-indigo/robot_state_publisher
    ros-indigo/rosbridge_server
    ros-indigo/rospy
    ros-indigo/roswww
    ros-indigo/rwt_utils_3rdparty
    ros-indigo/sensor_msgs
    ros-indigo/std_msgs
    ros-indigo/tf
    ros-indigo/tf2_web_republisher
    ros-indigo/visualization_msgs
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
    ros-indigo/message_generation
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}
