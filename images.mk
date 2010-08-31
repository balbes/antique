# build images
IMAGES=install-cd.iso install-dvd5.iso rescue-cd.iso minimal.iso live-cd.iso boot-debug-cd.iso addon-cd.iso
FLASHIMAGES=install-cd.flash install-dvd5.flash rescue-cd.flash minimal.flash live-cd.flash
OUTNAME_PREFIX_FULL=altlinux-$(INFO_VERSION)-$(DATE)-antique-i586-ru
OUTNAME_PREFIX_LATEST=altlinux-$(INFO_VERSION)-latest-antique-i586-ru

define image_out
mkdir -p /home/inter/out/antique
rm -rf /home/inter/out/antique/$(OUTNAME_PREFIX_FULL)-$@
mv -f /home/inter/out/antique/$@ /home/inter/out/antique/$(OUTNAME_PREFIX_FULL)-$@
ln -snf $(OUTNAME_PREFIX_FULL)-$@ /home/inter/out/antique/$(OUTNAME_PREFIX_LATEST)-$@
endef

define image_build
setarch i586 make -C profiles
endef

$(IMAGES):
	@echo '--- Building $@'
	$(call set,MKI_OUTNAME,$@,$(AUTOCFG))
	$(image_build)
	tests/check-iso-size /home/inter/out/antique/$@
#	isohybrid /home/inter/out/antique/$@
	$(image_out)
	$(call done,$@)

$(FLASHIMAGES):
	$(call set,MKI_OUTNAME,$@,$(AUTOCFG))
	$(call set,GLOBAL_BOOT_TYPE,syslinux,$(AUTOCFG))
	#(call set,GLOBAL_PROPAGATOR_MAR_MODULES,./modules-usb,$(AUTOCFG))
	$(image_build)
	$(image_out)
	$(call done,$@)

