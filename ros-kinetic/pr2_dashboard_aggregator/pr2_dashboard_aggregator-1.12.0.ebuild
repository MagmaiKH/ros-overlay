# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="A simple script that aggregates all of the topics that a "pr2_dashboard" app mig"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/pr2-gbp/pr2_common-release/archive/release/kinetic/pr2_dashboard_aggregator/1.12.0-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-kinetic/pr2_msgs
    ros-kinetic/rospy
    ros-kinetic/std_msgs
"
DEPEND="${RDEPEND}
    ros-kinetic/catkin
"

SLOT="0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    append-cxxflags "-std=c++11"
    export DEST_SETUP_DIR="/${ROS_PREFIX}"
    local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=${D}${ROS_PREFIX}
        -DCMAKE_PREFIX_PATH=/${ROS_PREFIX}
        -DPYTHON_EXECUTABLE=/usr/bin/ros-python
        -DCATKIN_BUILD_BINARY_PACKAGE=1
     )
    cmake-utils_src_configure
}

src_install() {
    cd ${WORKDIR}/${P}_build
    make install || die
}
