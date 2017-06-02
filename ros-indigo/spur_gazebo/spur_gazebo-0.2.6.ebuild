# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="3D simulation package for SPUR omni-directional mobile manipulator robot made at"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/spur-release/archive/release/indigo/spur_gazebo/0.2.6-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/effort_controllers
    ros-indigo/gazebo_ros
    ros-indigo/gazebo_ros_control
    ros-indigo/robot_state_publisher
    ros-indigo/spur_controller
    ros-indigo/spur_description
    ros-indigo/turtlebot_gazebo
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
    ros-indigo/rostest
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
