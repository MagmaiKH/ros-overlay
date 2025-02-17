# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=7
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit ament-cmake

DESCRIPTION="Controller for executing joint-space trajectories on a group of joints"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros2-gbp/ros2_controllers-release/archive/release/galactic/${PN}/1.1.0-1.tar.gz -> ${PN}-galactic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-galactic/angles
	ros-galactic/control_msgs
	ros-galactic/controller_interface
	ros-galactic/hardware_interface
	ros-galactic/pluginlib
	ros-galactic/rclcpp
	ros-galactic/rclcpp_lifecycle
	ros-galactic/realtime_tools
	ros-galactic/trajectory_msgs
	test? ( ros-galactic/ament_cmake_gtest )
	test? ( ros-galactic/controller_manager )
	test? ( ros-galactic/ros2_control_test_assets )
"
DEPEND="${RDEPEND}
	ros-galactic/ament_cmake
"

SLOT="0"
ROS_DISTRO="galactic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
