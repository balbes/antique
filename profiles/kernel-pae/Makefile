default: all

SQUASHFS_VERSION=4

# Include mkimage config file with default definitions
include /usr/share/mkimage/config.mk

# packagelist stuff
include ../functions.mk

CHROOT_PACKAGES = apt-utils rsync

PACKAGES_EXPAND_METHOD=regexp
#NO_CACHE=1

IMAGE_INIT_LIST = +branding-altlinux-desktop-release

# design-bootsplash should be in the head of the list 
IMAGE_PACKAGES = apt-conf-branch \
		 branding-altlinux-desktop-release \
		 $(call list,kernel-pae)

MKI_DESTDIR = ALTLinux/RPMS.kernel-pae

MKI_PACKTYPE = data

INFO_NAME	= ALT Linux kernel with >=4Gb RAM support (x86)
INFO_LABEL	= Desktop

# Include mkimage targets definitions
include /usr/share/mkimage/targets.mk

ifeq (i586,i586)
all: kernel-pae copy-packages run-scripts pack-image
else
all: pack-image
endif

kernel-pae:
	sed 's/std-def/std-pae/' < $(call list,kernel) > $(call list,kernel-pae)
