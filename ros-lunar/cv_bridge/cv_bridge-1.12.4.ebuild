# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This contains CvBridge, which converts between ROS
    Image messages and OpenCV images."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/vision_opencv-release/archive/release/lunar/cv_bridge/1.12.4-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/sensor_msgs
    ros-lunar/opencv3
    ros-lunar/rosconsole
    dev-libs/boost
    dev-lang/python
dev-lang/python-exec
"
DEPEND="
    ros-lunar/sensor_msgs
    ros-lunar/opencv3
    ros-lunar/rosconsole
    dev-libs/boost
    dev-lang/python
dev-lang/python-exec
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
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/lunar" || die
}