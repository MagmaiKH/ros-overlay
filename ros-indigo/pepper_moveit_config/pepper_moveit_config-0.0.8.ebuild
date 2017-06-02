# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="An automatically generated package with all the configuration and launch files f"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-naoqi/pepper_moveit_config-release/archive/release/indigo/pepper_moveit_config/0.0.8-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/joint_state_publisher
    ros-indigo/moveit_fake_controller_manager
    ros-indigo/moveit_planners_ompl
    ros-indigo/moveit_ros_move_group
    ros-indigo/moveit_simple_controller_manager
    ros-indigo/pepper_description
    ros-indigo/robot_state_publisher
    ros-indigo/xacro
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
