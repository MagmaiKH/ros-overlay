# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="The jderobot_assets package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/JdeRobot/assets-release/archive/release/melodic/${PN}/0.1.0-1.tar.gz -> ${PN}-melodic-release-${PV}.tar.gz"

LICENSE="MIT"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-melodic/gazebo_ros
	ros-melodic/roscpp
	ros-melodic/turtlebot3_description
	ros-melodic/turtlebot3_gazebo
"
DEPEND="${RDEPEND}
	ros-melodic/catkin
"

SLOT="0"
ROS_DISTRO="melodic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
