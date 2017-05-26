# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="http://wiki.ros.org/move_base"
SRC_URI="https://github.com/ros-gbp/navigation-release/archive/release/kinetic/move_base/1.14.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/clear_costmap_recovery
    ros-kinetic/costmap_2d
    ros-kinetic/move_base_msgs
    ros-kinetic/rospy
    ros-kinetic/std_srvs
    ros-kinetic/base_local_planner
    ros-kinetic/navfn
    ros-kinetic/rotate_recovery
    ros-kinetic/nav_msgs
    ros-kinetic/pluginlib
    ros-kinetic/roscpp
    ros-kinetic/visualization_msgs
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/message_runtime
    ros-kinetic/std_msgs
    ros-kinetic/tf
    ros-kinetic/geometry_msgs
    ros-kinetic/nav_core
    ros-kinetic/actionlib
"
DEPEND="
    ros-kinetic/move_base_msgs
    ros-kinetic/costmap_2d
    ros-kinetic/rospy
    ros-kinetic/std_srvs
    ros-kinetic/cmake_modules
    ros-kinetic/clear_costmap_recovery
    ros-kinetic/base_local_planner
    ros-kinetic/navfn
    ros-kinetic/nav_msgs
    ros-kinetic/pluginlib
    ros-kinetic/rotate_recovery
    ros-kinetic/roscpp
    ros-kinetic/visualization_msgs
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/tf
    ros-kinetic/message_generation
    ros-kinetic/std_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/nav_core
    ros-kinetic/actionlib
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
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
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/kinetic" || die
}