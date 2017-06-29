# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="A collection of node(let)s that stream images from USB cameras (UVC)
     and pr"
HOMEPAGE="http://ros.org/wiki/uvc_camera"
SRC_URI="https://github.com/ros-drivers-gbp/camera_umd-release/archive/release/lunar/uvc_camera/0.2.5-0.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
PYTHON_DEPEND="3::3.5"

RDEPEND="
    ros-lunar/camera_info_manager
    ros-lunar/image_transport
    ros-lunar/nodelet
    ros-lunar/roscpp
    ros-lunar/sensor_msgs
    media-libs/libv4l
"
DEPEND="${RDEPEND}
    ros-lunar/catkin
"

SLOT="lunar"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="/opt/ros/lunar"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    append-cxxflags "-std=c++11"
    export DEST_SETUP_DIR="${ROS_PREFIX}"
    local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=${D%/}${ROS_PREFIX}
        -DCMAKE_PREFIX_PATH=${ROS_PREFIX}
        -DPYTHON_INSTALL_DIR=lib64/python3.5/site-packages
        -DCATKIN_ENABLE_TESTING=OFF
        -DPYTHON_EXECUTABLE=/usr/bin/ros-python-lunar
        -DCATKIN_BUILD_BINARY_PACAKGE=1

     )
    cmake-utils_src_configure
}

src_install() {
    cd ${WORKDIR}/${P}_build
    make install || die
}