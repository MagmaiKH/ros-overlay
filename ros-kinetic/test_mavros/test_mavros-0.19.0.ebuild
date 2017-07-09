# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Tests for MAVROS package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/mavlink/mavros-release/archive/release/kinetic/test_mavros/0.19.0-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="( BSD GPL-3 LGPL-3 )"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
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
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

