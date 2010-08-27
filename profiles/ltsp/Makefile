default: all

SQUASHFS_VERSION=4

include /usr/share/mkimage/config.mk

# packagelist stuff
include ../functions.mk

CHROOT_PACKAGES = apt-utils rsync
IMAGE_PACKAGES = $(call list,disk-ltsp)
MKI_PACKTYPE = data
MKI_DESTDIR = ALTLinux/RPMS.ltsp

INFO_NAME	= ALTSP
INFO_LABEL	= Terminal

include /usr/share/mkimage/targets.mk

all: copy-packages pack-image
