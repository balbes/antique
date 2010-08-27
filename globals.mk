# global stuff
export
INFO_ORIGIN=ALT Linux Team
INFO_PUBLISHER=ALT Linux
INFO_DISTRIBUTION=ALT Linux

INFO_ARCH=i586
TARGET=i586
INFO_LABEL=Antique

INFO_VERSION=5.1

# FIXME: INFO_* won't fall through to profiles/*/Makefile
GLOBAL_RELEASE=$(INFO_RELEASE)

GLOBAL_BOOT_LANG=ru_RU
GLOBAL_HSH_APT_CONFIG=/etc/apt/apt.conf

GLOBAL_TOPDIR=/home/inter/mkiso/antique/mkimage-profiles-desktop_antique
GLOBAL_WORKROOT=$(TMP)

DATE=$(shell date +%Y%m%d)

# byte counts; might be wrong (m4rk3ting 700Mb, 4.7Gb)
CD_SIZE  = 734003200
DVD_SIZE = 4700000000

SQUASHFS_VERSION=4
