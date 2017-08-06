# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Driver package for interfacing the battery management system \(BMS\) on Care-O-bot"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ipa320/cob_driver-release/archive/release/kinetic/cob_bms_driver/0.6.10-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="LGPL-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/cob_msgs
	ros-kinetic/cob_srvs
	ros-kinetic/diagnostic_msgs
	ros-kinetic/diagnostic_updater
	ros-kinetic/roscpp
	ros-kinetic/rospy
	ros-kinetic/socketcan_interface
	ros-kinetic/std_msgs
	dev-python/numpy
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
