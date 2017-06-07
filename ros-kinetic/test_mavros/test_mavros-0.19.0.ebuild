# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="Tests for MAVROS package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/mavlink/mavros-release/archive/release/kinetic/test_mavros/0.19.0-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="|| ( BSD GPL-3 LGPL-3 )"
KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-kinetic/control_toolbox
    ros-kinetic/eigen_conversions
    ros-kinetic/geometry_msgs
    ros-kinetic/mavros
    ros-kinetic/mavros_extras
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/tf2_ros
    dev-cpp/eigen
"
DEPEND="${RDEPEND}
    ros-kinetic/angles
    ros-kinetic/catkin
    ros-kinetic/cmake_modules
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
