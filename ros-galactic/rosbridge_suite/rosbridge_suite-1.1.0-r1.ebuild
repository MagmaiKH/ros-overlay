# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=7
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit ament-cmake

DESCRIPTION="Rosbridge provides a JSON API to ROS functionality for non-ROS programs.\
 [...]"
HOMEPAGE="http://ros.org/wiki/rosbridge_suite"
SRC_URI="https://github.com/ros2-gbp/${PN}-release/archive/release/galactic/${PN}/1.1.0-1.tar.gz -> ${PN}-galactic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-galactic/rosapi
	ros-galactic/rosbridge_library
	ros-galactic/rosbridge_server
"
DEPEND="${RDEPEND}
	ros-galactic/ament_cmake_core
"

SLOT="0"
ROS_DISTRO="galactic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
