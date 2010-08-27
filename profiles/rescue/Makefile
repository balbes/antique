default: all

SQUASHFS_VERSION=4

# Include mkimage config file with default definitions
include /usr/share/mkimage/config.mk

# packagelist stuff
include ../functions.mk

IMAGE_INIT_LIST = +branding-altlinux-desktop-release
IMAGE_PACKAGES = branding-altlinux-desktop-release branding-altlinux-desktop-bootloader $(call list,rescue)

MKI_PACKTYPE = squash
MKI_OUTNAME = rescue

# Include mkimage targets definitions
include /usr/share/mkimage/targets.mk

all: build-image run-image-scripts run-scripts pack-image
	# FIXME: this kludge should be fixed along with main/'s one
	# by moving .base generation where it belongs, to software/
	@mkdir -p `dirname $(call list,.base)`
	@touch $(call list,.base)
