# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=7
PYTHON_COMPAT=( python{3_8,3_9,3_10} )

inherit ament-cmake

DESCRIPTION="Library for capturing data from the Intel\(R\) RealSense\(TM\) SR300, D400,[...]"
HOMEPAGE="https://github.com/IntelRealSense/librealsense/"
SRC_URI="https://github.com/IntelRealSense/${PN}-release/archive/release/galactic/${PN}/2.50.0-1.tar.gz -> ${PN}-galactic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
"
DEPEND="${RDEPEND}
	ros-galactic/ament_cmake
	sys-kernel/dkms
	dev-libs/openssl
	virtual/libudev
	virtual/libusb:1
	virtual/pkgconfig
	sys-fs/udev
"

SLOT="0"
ROS_DISTRO="galactic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"