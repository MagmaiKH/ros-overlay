# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Parser for Semantic Robot Description Format (SRDF)."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/srdfdom-release/archive/release/lunar/srdfdom/0.4.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/urdfdom_py
    dev-libs/urdfdom_headers
    dev-libs/boost
    dev-libs/tinyxml
    dev-libs/console_bridge
"
DEPEND="
    ros-lunar/urdf
    ros-lunar/urdfdom_py
    ros-lunar/cmake_modules
    dev-libs/boost
    dev-libs/tinyxml
    dev-libs/console_bridge
    dev-libs/urdfdom_headers
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