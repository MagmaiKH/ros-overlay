# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="C++ driver library for Kobuki:
    Pure C++ driver library for Kobuki. This is for those who do not wish to use ROS on their systems."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/kobuki_core-release/archive/release/kinetic/kobuki_driver/0.7.8-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/ecl_mobile_robot
    ros-kinetic/ecl_devices
    ros-kinetic/ecl_time
    ros-kinetic/ecl_sigslots
    ros-kinetic/ecl_converters
    ros-kinetic/ecl_command_line
    ros-kinetic/ecl_geometry
"
DEPEND="
    ros-kinetic/ecl_mobile_robot
    ros-kinetic/ecl_devices
    ros-kinetic/ecl_build
    ros-kinetic/ecl_sigslots
    ros-kinetic/ecl_converters
    ros-kinetic/ecl_time
    ros-kinetic/ecl_command_line
    ros-kinetic/ecl_geometry
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