default: all

include globals.mk
include functions.mk
include use.mk
include images.mk
include clean.mk

PRODUCTS = antique.cd kde.cd lite.cd slinux.cd gnome.cd minimal.cd icemaker.cd fvwm.cd \
	test.dvd runa.dvd etersoft.dvd buildsystem.cd \
	ltsp-kde3.cd ltsp-kde3.dvd ltsp-kde.cd ltsp-gnome.cd ltsp-slinux.cd \
	live.cd live-gnome.cd live-lite.cd live-xlite.cd live-homeros.cd \
	live-kde.dvd sugar.cd lxde.cd office-server.cd school-server.cd server-light.cd children.cd \
	rescue.cd custom.cd \
	master.dvd junior.dvd school-lite.cd1 school-lite.cd2 \
	chainmail.cd

.PHONY: $(PRODUCTS) rinse

# this should build something reasonable 
# after ./configure --with-distro={desktop,lite}
all: antique.cd

# "|" in prerequisites means...
# Quick answer: "... the rules to be invoked without forcing the target to be updated
# if one of those rules is executed."
# Long answer: "http://www.gnu.org/software/make/manual/make.html#Prerequisite-Types"

# Mandatory actions for any product:
$(PRODUCTS): | rinse

# distro construction
children.cd: | use-kde3-live use-children live live-cd.iso
kde.cd: | use-kde-lite use-nm install2 main install-cd.iso
kde.dvd: | use-kde-desktop use-kde-live use-nm use-live-restore use-freenx $(EVERYTHING) install-dvd5.iso
gnome.dvd: |  use-gnome-live-dvd use-gnome-dvd use-nm use-live-restore use-compiz use-freenx install2 main live rescue install-dvd5.iso
gnome-test.dvd: |  use-gnome-dvd use-compiz use-nm use-freenx install2 main install-dvd5.iso
test.dvd: | use-kde-desktop use-nm use-freenx install2 main install-dvd5.iso
kde3.cd: | use-kde3-lite use-nm install2 main install-cd.iso
kde3.dvd: | use-kde3 use-nm use-freenx $(EVERYTHING)  install-dvd5.iso

gnome.cd: | use-gnome use-nm use-compiz use-freenx install2 main install-cd.iso
workbench.cd: | use-gnome-workbench use-desktop use-pkcs11 use-pkcs11-workbench install2 main install-cd.iso
lite.cd: | use-xfce use-xdm install2 main install-cd.iso
slinux.cd: | use-slinux use-gdm install2 main install-cd.iso
#*********************
console.cd: | install2 main rescue install-cd.iso
WM-mini.cd: | use-WM-mini use-wdm install2 main install-cd.iso
icewm-mini.cd: | use-icewm-mini use-xdm install2 main install-cd.iso
antique.cd: | use-antique use-xdm install2 main rescue install-cd.iso
antique-full.cd: | use-antique-base disk-antique-disk use-xdm install2 main rescue install-cd.iso
antique-base.cd: | use-antique-base use-xdm install2 main install-cd.iso
#*********************
minimal.cd: | use-icewm use-xdm install2 main  install-cd.iso
icemaker.cd: | use-icewm use-wmaker use-xdm install2 main install-cd.iso
fvwm.cd: | use-fvwm use-xdm install2 main install-cd.iso
lxde.cd: | use-lxde use-xdm install2 main install-cd.iso
sugar.cd: | use-sugar use-xdm install2 main install-cd.iso

custom.cd: | use-custom install2 main install-cd.iso
rescue.cd: | rescue rescue-cd.iso
boot-debug.cd: | use-server boot-debug-cd.iso

slinux-live.cd: | use-slinux use-gdm live live-cd.iso
live.cd: | use-kde-live use-nm live live-cd.iso
live-custom.cd: | use-custom live-cd.iso
live-gnome.cd: | use-gnome use-nm live live-cd.iso
live-gnome-light.cd: use-gnome-light use-nm live live-cd.iso
live-gnome-artist.cd: use-gnome-artist-live use-nm live live-cd.iso
live-gnome.dvd: | use-gnome-live-dvd use-nm live live-cd.iso
live-homeros.cd: | use-homeros live live-cd.iso
live-xlite.cd: | use-icewm live live-cd.iso
live-rdp.cd: | use-rdp live live-cd.iso
live-icemaker.cd: | use-icewm use-wmaker use-autologin live live-cd.iso
live-kde.dvd: | use-kde-live-dvd use-nm live live-cd.iso
live-lite.cd: | use-xfce use-xdm live live-cd.iso

# Experimental crypto
crypto-flash: use-gnome-light use-nm live use-encfs-homes live-cd.iso

# full contrib won't currently build from sisyphus
#runa.dvd: | use-kde use-runa $(EVERYTHING) dvd.iso
etersoft.cd: | use-kde-lite use-etersoft-network use-nm install2 main install-cd.iso
etersoft.dvd: | use-kde use-kde-live use-etersoft-network use-nm install2 main live rescue contrib  install-dvd5.iso
ltsp-kde3.cd: | use-kde3-lite use-ltsp install2 main ltsp install-cd.iso
ltsp-kde3.dvd: | use-kde3 use-ltsp $(EVERYTHING)  ltsp install-dvd5.iso
ltsp-gnome.cd: | use-gnome-light use-ltsp install2 main ltsp install-cd.iso
ltsp-kde.cd: | use-kde-lite use-ltsp install2 main ltsp install-cd.iso
ltsp-slinux.cd: | use-slinux use-ltsp install2 main ltsp install-cd.iso
runa.dvd: | use-kde use-runa use-nm install2 main live rescue  install-dvd5.iso

office-server.cd: | use-server use-office-server install2 main rescue install-cd.iso
school-server.cd: | use-server use-office-server use-school-server install2 main rescue install-cd.iso
backup-server.cd: | use-backup install2 main install-cd.iso
389-server.cd: | use-389 install2 main install-cd.iso
v12n-server.cd: | use-v12n install2 main install-cd.iso
pbx-huge.dvd: | use-pbx-huge install2 main rescue install-cd.iso

chainmail.cd: | use-chainmail install2 main rescue install-cd.iso

server-light.cd: | use-server-light install2 main rescue install-cd.iso

buildsystem.cd: | use-kde-lite use-buildsystem install2 main  install-cd.iso

# school suite
master.dvd: | use-pspo-kde vm-profile-master install2 main live install-dvd5.iso
master-test.dvd: | use-pspo-kde vm-profile-master install2 main install-dvd5.iso
junior.dvd: | use-pspo-gnome install2 main live install-dvd5.iso
school-lite.cd1: | use-school-lite use-xfce-docs use-docs use-xfce-graphics-lite use-desktop \
	install2 main install-cd.iso
school-lite.cd2: | use-school-lite addon-pspo-xfce addon main addon-cd.iso
school-terminal.dvd: | use-pspo-kde3 use-kde3 use-ltsp vm-profile-master install2 main rescue ltsp install-dvd5.iso
