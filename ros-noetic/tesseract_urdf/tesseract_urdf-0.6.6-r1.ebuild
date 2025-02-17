# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=7
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit ros-cmake

DESCRIPTION="The tesseract_urdf package for parsing tesseract specific urdf"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-industrial-release/tesseract-release/archive/release/noetic/${PN}/0.6.6-1.tar.gz -> ${PN}-noetic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-noetic/tesseract_collision
	ros-noetic/tesseract_common
	ros-noetic/tesseract_geometry
	ros-noetic/tesseract_scene_graph
	test? ( ros-noetic/tesseract_support )
	dev-cpp/eigen
	dev-libs/console_bridge
	sci-libs/pcl
	sci-libs/pcl
	test? ( dev-cpp/gtest )
"
DEPEND="${RDEPEND}
	ros-noetic/ros_industrial_cmake_boilerplate
	dev-util/cmake
"

SLOT="0"
ROS_DISTRO="noetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
