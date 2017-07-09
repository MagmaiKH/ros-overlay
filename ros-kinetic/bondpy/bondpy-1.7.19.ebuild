# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Python implementation of bond, a mechanism for checking when	another process"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/bond_core-release/archive/release/kinetic/bondpy/1.7.19-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/rospy
	ros-kinetic/smclib
	dev-libs/ossp-uuid
"
DEPEND="${RDEPEND}
	ros-kinetic/bond
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

