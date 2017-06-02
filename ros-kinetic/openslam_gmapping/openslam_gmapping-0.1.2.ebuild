# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="ROS-ified version of gmapping SLAM. Forked from https://openslam.informatik.uni-"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/openslam_gmapping-release/archive/release/kinetic/openslam_gmapping/0.1.2-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="CreativeCommons-by-nc-sa-2.0"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
"
DEPEND="${RDEPEND}
    ros-kinetic/catkin
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

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
