# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The alfred_sr_linux package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/rosalfred-release/alfred_sr_linux-release/archive/release/indigo/alfred_sr_linux/0.1.20-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="GPLv3"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/dynamic_reconfigure
    ros-indigo/message_runtime
    ros-indigo/rospy
    ros-indigo/smarthome_media_msgs
    ros-indigo/sound_play
    ros-indigo/std_msgs
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
