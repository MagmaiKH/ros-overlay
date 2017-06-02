# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="sdsdddsdsds"
HOMEPAGE="http://ros.org/wiki/multi_interface_roam"
SRC_URI="https://github.com/TheDash/linux_networking-release/archive/release/indigo/multi_interface_roam/1.0.11-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="|| ( "BSD" "LGPL" "GPL for sigblock" )"
KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/asmach
    ros-indigo/diagnostic_msgs
    ros-indigo/dynamic_reconfigure
    ros-indigo/ieee80211_channels
    ros-indigo/network_monitor_udp
    ros-indigo/pr2_msgs
    ros-indigo/rospy
    ros-indigo/std_msgs
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
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
