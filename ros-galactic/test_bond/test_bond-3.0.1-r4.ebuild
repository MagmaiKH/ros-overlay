# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=7
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit ament-cmake

DESCRIPTION="Contains tests for \[\[bond\]\], including tests for \[\[bondcpp\]\]."
HOMEPAGE="http://www.ros.org/wiki/test_bond"
SRC_URI="https://github.com/ros2-gbp/bond_core-release/archive/release/galactic/${PN}/3.0.1-4.tar.gz -> ${PN}-galactic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-galactic/builtin_interfaces
	ros-galactic/rosidl_default_runtime
	ros-galactic/std_msgs
	test? ( ros-galactic/ament_cmake_gtest )
	test? ( ros-galactic/ament_lint_auto )
	test? ( ros-galactic/ament_lint_common )
	test? ( ros-galactic/bond )
	test? ( ros-galactic/bondcpp )
	test? ( ros-galactic/rclcpp )
	test? ( ros-galactic/rclcpp_lifecycle )
	test? ( virtual/pkgconfig )
	test? ( dev-libs/ossp-uuid )
"
DEPEND="${RDEPEND}
	ros-galactic/ament_cmake
	ros-galactic/rclcpp_lifecycle
	ros-galactic/rosidl_default_generators
"

SLOT="0"
ROS_DISTRO="galactic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
