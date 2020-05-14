# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="Components of MoveIt! used for manipulation"
HOMEPAGE="http://moveit.ros.org"
SRC_URI="https://github.com/ros-gbp/moveit-release/archive/release/melodic/${PN}/1.0.3-2.tar.gz -> ${PN}-melodic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-melodic/actionlib
	ros-melodic/dynamic_reconfigure
	ros-melodic/moveit_core
	ros-melodic/moveit_msgs
	ros-melodic/moveit_ros_move_group
	ros-melodic/moveit_ros_planning
	ros-melodic/pluginlib
	ros-melodic/rosconsole
	ros-melodic/roscpp
	ros-melodic/tf2_eigen
"
DEPEND="${RDEPEND}
	ros-melodic/catkin
	dev-cpp/eigen
"

SLOT="0"
ROS_DISTRO="melodic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"