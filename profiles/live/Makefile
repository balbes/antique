default: all

SQUASHFS_VERSION=4

# Include mkimage config file with default definitions
include /usr/share/mkimage/config.mk

# Include autogenerated settings for specific product flavor
# Not neccessary for clean family targets.
-include stage-autocfg.mk

# packagelist stuff
include ../functions.mk

ifeq "$(USE_CLAMAV)" "1"
	CLAMDB=.work/.cache/clam/etc/skel/.klamav/database/main.cvd
	CLAMCOPY=copy-tree
	COPY_TREE=.work/.cache/clam
	# FIXME: klamav only?
	GLOBAL_LIVE_PACKAGES+=klamav
endif

# FIXME: hardwired l10n, see also #16863
GLOBAL_HSH_LANGS=en_US:ru_RU

# Make build log look pretty
PACK_SQUASHFS_OPTS=-no-progress

IMAGE_INIT_LIST = +branding-altlinux-desktop-release

LOCAL_LIVE_PACKAGE_LISTS = kernel live
IMAGE_PACKAGES = \
		 branding-altlinux-desktop-release \
		 branding-altlinux-desktop-bootsplash \
		 branding-altlinux-desktop-graphics \
		 branding-altlinux-desktop-notes \
		 branding-altlinux-desktop-alterator \
		 branding-altlinux-desktop-indexhtml \
		 branding-altlinux-desktop-bootloader \
		 apt-conf-branch \
		 $(GLOBAL_LIVE_PACKAGES) \
		 $(call list,kernel) \
		 $(call list,live) \
		 $(call list,$(GLOBAL_LIVE_PACKAGE_LISTS)) \
		 $(call list,$(GLOBAL_LIVE_PKG_GROUPS))

MKI_PACKTYPE = squash
MKI_OUTNAME = live

# Include mkimage targets definitions
include /usr/share/mkimage/targets.mk

all: build-image $(CLAMDB) $(CLAMCOPY) run-scripts run-image-scripts pack-image
	# FIXME: this kludge should be fixed along with main/'s one
	# by moving .base generation where it belongs, to software/
	@mkdir -p `dirname $(call list,.base)`
	@touch $(call list,.base)

.work/.cache/clam/etc/skel/.klamav/database/main.cvd:
	mkdir -p .work/.cache/clam/etc/skel/.klamav/database
	wget -P .work/.cache/clam/etc/skel/.klamav/database http://database.clamav.net//main.cvd
	wget -P .work/.cache/clam/etc/skel/.klamav/database http://database.clamav.net//daily.cvd
