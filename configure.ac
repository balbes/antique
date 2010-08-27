AC_INIT( [mkimage-profiles-desktop], [0.1], [http://bugzilla.altlinux.ru] )

AC_ARG_WITH(aptconf,
	    AC_HELP_STRING([--with-aptconf=file],
			   [custom apt.conf location, e.g '--with-aptconf=/home/user/apt.conf']),
			   [
			    AC_MSG_CHECKING([apt.conf file])
			    if test -r "$with_aptconf"  ; then
				    APTCONF="$with_aptconf"
				    AC_MSG_RESULT([** $with_aptconf exists])
			    else
				    echo "WARNING: $with_aptconf not usable, ignoring"
			    fi
			    ],
			    [
			     APTCONF=/etc/apt/apt.conf
			     ])

AC_ARG_WITH(isolinux-default,
	    AC_HELP_STRING([--with-isolinux-default=harddisk],
			   [default isolinux menu entry, e.g '--with-isolinux-default=live'])
				     )
ISOLINUX_DEFAULT=${with_isolinux_default:-"harddisk"}

AC_ARG_WITH(distro,
	    AC_HELP_STRING([--with-distro=distro],
			   [base distro, e.g '--with-distro=lite' (implies branding/docs)]),
			   [
			    if test -n "$with_distro"  ; then
				    DISTRO="$with_distro"
				    APTCONF_PACKAGE="branch"
			            case "$DISTRO" in
				    antique*)
					BRANDING=${with_branding:-"altlinux-desktop"}
					DOCS=
					NODOCS="#"
					INSTALLER=${with_installer:-"desktop"}
					LABEL="Antique"
					APTCONF_PACKAGE="branch"
					DEFAULT_ISO="antique.cd"
					KERNEL="un-def"
					KERNEL_MOD="un-def";;
				    lite*)
					BRANDING=${with_branding:-"altlinux-lite"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Lite"
					INSTALLER=${with_installer:-"desktop"}
					DEFAULT_ISO=${with_image:-"lite.cd"};;
				    slinux*)
					BRANDING=${with_branding:-"simply-linux"}
					DOCS=${with_docs:-"lite"}
					LABEL="Simply linux"
					BRAND="simply"
					DESIGN="slinux"
					INSTALLER=${with_installer:-"simply-linux"}
					DEFAULT_ISO=${with_image:-"slinux.cd"};;
				    terminal*)
					BRANDING=${with_branding:-"altlinux-terminal"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Terminal"
					INSTALLER=${with_installer:-"desktop"}
					DEFAULT_ISO="ltsp-kde.cd";;
				    desktop*)
					BRANDING=${with_branding:-"altlinux-desktop"}
					DOCS=${with_docs:-"desktop"}
					INSTALLER=${with_installer:-"desktop"}
					LABEL="Desktop"
					DEFAULT_ISO=${with_image:-"test.dvd"};;
				    kdesktop)
					BRANDING=${with_branding:-"altlinux-kdesktop"}
					DOCS=${with_docs:-"kdesktop"}
					INSTALLER=${with_installer:-"desktop"}
					LABEL="Desktop KDE"
					BRAND="altlinux"
					DESIGN="branding-altlinux-kdesktop"
					DEFAULT_ISO="kde.dvd";;
				    children*)
					BRANDING=${with_branding:-"altlinux-children"}
					DOCS=${with_docs:-"children"}
					DEFAULT_ISO="children.cd";;
				    master)
					BRANDING=${with_branding:-"school-master"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Master"
					INSTALLER=${with_installer:-"desktop"}
					DEFAULT_ISO=${with_image:-"master.dvd"};;
				    junior)
					BRANDING=${with_branding:-"school-junior"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Junior"
					INSTALLER=${with_installer:-"desktop"}
					DEFAULT_ISO=${with_image:-"junior.dvd"};;
				    school-lite)
					BRANDING=${with_branding:-"school-lite"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Lite"
					INSTALLER=${with_installer:-"junior"}
					DEFAULT_ISO=${with_image:-"school-lite.cd1 school-lite.cd2"};;
				    office-server*)
					BRANDING=${with_branding:-"altlinux-office-server"}
					DOCS=${with_docs:-"office-server"}
					INSTALLER=${with_installer:-"office-server"}
					LABEL="OfficeServer"
					DEFAULT_ISO="office-server.cd";;
				    server-light*)
					BRANDING=${with_branding:-"branding-sisyphus-server-light"}
					DOCS=
					NODOCS="#"
					INSTALLER=${with_installer:-"server-light"}
					LABEL="Server"
					APTCONF_PACKAGE="sisyphus"
					DEFAULT_ISO="server-light.cd"
					KERNEL="un-def"
					KERNEL_MOD="un-def";;
				    school-server*)
					BRANDING=${with_branding:-"altlinux-school-server"}
					DOCS=${with_docs:-"school-server"}
					INSTALLER=${with_installer:-"office-server"}
					LABEL="SchoolServer"
					DEFAULT_ISO="school-server.cd";;
				    backup-server*)
					BRANDING=${with_branding:-"altlinux-backup-server"}
					DOCS=${with_docs:-"server"}
					INSTALLER=${with_installer:-"backup-server"}
					LABEL="Server"
					DEFAULT_ISO="backup-server.cd";;
				    389-server*)
					BRANDING=${with_branding:-"altlinux-office-server"}
					DOCS=${with_docs:-"server"}
					INSTALLER=${with_installer:-"389-server"}
					LABEL="389 Server"
					DEFAULT_ISO="389-server.cd";;
				    v12n-server*)
					BRANDING=${with_branding:-"altlinux-office-server"}
					DOCS=${with_docs:-"server"}
					INSTALLER=${with_installer:-"v12n-server"}
					LABEL="V12n Server"
					DEFAULT_ISO="v12n-server.cd";;
				    pbx-huge*)
					BRANDING=${with_branding:-"altlinux-office-server"}
					DOCS=${with_docs:-"server"}
					INSTALLER=${with_installer:-"v12n-server"}
					LABEL="PBX"
					DEFAULT_ISO="pbx-huge.dvd";;
				    retro-desktop*)
					BRANDING=${with_branding:-"altlinux-desktop"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Retro Desktop"
					INSTALLER=${with_installer:-"desktop"}
					DEFAULT_ISO="kde3.dvd";;
				    chainmail*)
					BRANDING=${with_branding:-"ivk-chainmail"}
					DOCS=${with_docs:-"chainmail"}
					INSTALLER=${with_installer:-"chainmail"}
					LABEL="Chainmail"
					DEFAULT_ISO="chainmail.cd";;
			    	    workbench)
					BRANDING=${with_branding:-"altlinux-workbench"}
					INSTALLER=${with_installer:-"workbench"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Workbench"
					DEFAULT_ISO=${with_image:-"workbench.cd"};;
			    	    gnome-desktop*)
					BRANDING=${with_branding:-"altlinux-gnome-desktop"}
					INSTALLER=${with_installer:-"desktop"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Gnome Desktop"
					DEFAULT_ISO=${with_image:-"gnome-test.dvd"};;
				    lxde-desktop*)
					BRANDING=${with_branding:-"altlinux-desktop"}
					INSTALLER=${with_installer:-"desktop"}
					DOCS=${with_docs:-"desktop"}
					LABEL="LXDE Desktop"
					DEFAULT_ISO=${with_image:-"lxde.cd"};;
				    sugar-desktop*)
					BRANDING=${with_branding:-"altlinux-desktop"}
					INSTALLER=${with_installer:-"desktop"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Sugar Desktop"
					DEFAULT_ISO="sugar.cd";;
				    homeros*)
					BRANDING=${with_branding:-"altlinux-desktop"}
					INSTALLER=${with_installer:-"desktop"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Homeros"
					ISOLINUX_DEFAULT=${with_isolinux_default:-"live"}
					DEFAULT_ISO="live-homeros.cd";;
				    custom*)
					BRANDING=${with_branding:-"altlinux-desktop"}
					INSTALLER=${with_installer:-"desktop"}
					if test -n "$with_docs"; then
						DOCS="$with_docs"
					else
						DOCS="NONE"
						NODOCS="#"
					fi
					LABEL="Custom"
					DEFAULT_ISO="custom.cd";;
				    *)
					BRANDING=${with_branding:-"altlinux-desktop"}
					INSTALLER=${with_installer:-"desktop"}
					DOCS=${with_docs:-"desktop"}
					LABEL="Desktop"
					DEFAULT_ISO="kde.dvd";;
				    esac
                                    test -n "$BRAND" || BRAND=$(echo "$BRANDING" | cut -d- -f1)
                                    test -n "$DESIGN" || DESIGN=$(echo "$BRANDING" | cut -d- -f2-)
			    fi
			    AC_MSG_RESULT([** distro: $DISTRO])
			    AC_MSG_RESULT([** installer: $INSTALLER])
			       ],
				    [
				        DISTRO="desktop"
					BRANDING="altlinux-desktop"
					INSTALLER=${with_installer:-"desktop"}
                                        BRAND=$(echo "$BRANDING" | cut -d- -f1)
                                        DESIGN=$(echo "$BRANDING" | cut -d- -f2-)
					DOCS="desktop"
					LABEL="Desktop"
				        APTCONF_PACKAGE="branch"
					DEFAULT_ISO="kde.dvd"
				     ])


AC_ARG_WITH(version,
	    AC_HELP_STRING([--with-version=string],
			   [version string, e.g. '--with-version=4.0.x']),
			   [
			    case "$with_version" in
				[0-9].[0-9].[0-9])
				    BRANCH="${with_version%.[0-9]}"
				    VERSION="$with_version";;
				*)
				    BRANCH="$with_version"
				    VERSION="$with_version";;
			    esac
			    AC_MSG_RESULT([** branch: $with_version])
			    AC_MSG_RESULT([** version: $with_version])
			    ],
			    [
			     BRANCH="5.1"
			     VERSION="5.1"
			     ])



AC_ARG_WITH(image,
	    AC_HELP_STRING([--with-image=install.cd],
			   [default image to build])
				     )

AC_ARG_WITH(branding,
	    AC_HELP_STRING([--with-branding=altlinux-desktop],
			   [custom design, license and so on'])
				     )

# TODO: --with-addons
AC_ARG_WITH(features,
	    AC_HELP_STRING([--with-features=icewm,sound-editing],
			   [comma-separated list of use-* feature blocks]),
			   [
			    if test -n "$with_features"  ; then
				    FEATURES="$with_features"
			    fi
			    AC_MSG_RESULT([** features: $FEATURES])
			       ])

# FIXME: see #20490 for discussion of default NODOCS
AC_ARG_WITH(docs,
	    AC_HELP_STRING([--with-docs=docs],
			   [custom docs, e.g '--with-docs=desktop_lite']),
			   [
			    if test -n "$with_docs"  ; then
				case "$with_docs" in
				no) DOCS=; NODOCS="#";;
				*)  DOCS="$with_docs"; NODOCS=;;
				esac
			    fi
			    AC_MSG_RESULT([** docs: $DOCS])
			       ],
			       [
				echo '** warning: please consider distro-specific docs'
				#NODOCS="#"
				])

AC_ARG_WITH(language,
	    AC_HELP_STRING([--with-language=locale],
			   [default bootloader language setting, e.g '--with-language=ru_RU']),
			   [
			    if test -n "$with_language"  ; then
				    LOCALE="$with_language"
				    LANGUAGE=`echo $with_language| sed 's/_.*//'`
			    fi
			    ],
			    [
			     LOCALE="ru_RU"
			     LANGUAGE="ru"
			     ])

AC_ARG_WITH(installer,
	    AC_HELP_STRING([--with-installer=desktop],
			   [installer-distro, e.g '--with-installer=office-desktop'])
			     )


AC_ARG_WITH(arch,
	    AC_HELP_STRING([--with-arch=arch],
			   [arch setting, e.g '--with-arch=i586' or '--with-arch=x86_64']),
			   [
			    if test -n "$with_arch"  ; then
				    ARCH="$with_arch"
				    if test "$ARCH" != 'i586'; then I586_ONLY='#'; fi
			    fi
			    ],
			    [
			     ARCH="`arch | sed 's/i686/i586/'`"
			     if test "$ARCH" != 'i586'; then I586_ONLY='#'; fi
			     ])

AC_ARG_WITH(kernel,
	    AC_HELP_STRING([--with-kernel=kernel],
			   [kernel flavour, e.g '--with-kernel="std-smp=2.6.18-alt12"']),
			   [
			    if test -n "$with_kernel"  ; then
				    KERNEL="$with_kernel" # apt-style
				    KERNEL_MOD=`echo "$with_kernel" | bin/generate-modversion ` # 2.6.18-std-smp-alt12
				    KERNEL_VER=`echo "$with_kernel" | bin/generate-modversion -v`     # 2.6.18
				    KERNEL_FLAVOUR=`echo "$with_kernel" | bin/generate-modversion -f` # std-smp
				    KERNEL_RELEASE=`echo "$with_kernel" | bin/generate-modversion -r` # alt12
				    KERNEL_REL=`echo "$with_kernel" | bin/generate-modversion -R`     # 12
			    fi
			    ],
			    [
			     test -n "$KERNEL" || KERNEL="std-def"
			     test -n "$KERNEL_MOD" || KERNEL_MOD="std-def"
			     ])

AC_ARG_WITH(outdir,
	    AC_HELP_STRING([--with-outdir=dir],
			   [custom output files location, e.g '--with-outdir=/home/user/out/']),
			   [
			    AC_MSG_CHECKING([outdir])
			    if test -d "$with_outdir"; then
				    OUTDIR="$with_outdir"
				    AC_MSG_RESULT([** $with_outdir exists])
			    else
			            OUTDIR=$HOME/out/${with_distro:-desktop}
				    AC_MSG_RESULT([** $with_outdir doesn't exists, using $OUTDIR])
			    fi
			    ],
			    [
			     OUTDIR=$HOME/out/${with_distro:-desktop}
			     ])

AC_ARG_WITH(mkimage,
	    AC_HELP_STRING([--with-mkimage=dir],
			   [custom mkimage prefix, e.g '--with-mkimage=/home/user/']),
			   [
			    AC_MSG_CHECKING([mkimage])
			    if test -d "$with_mkimage/usr/share/mkimage"; then
				    MKI_PREFIX="$with_mkimage"
				    AC_MSG_RESULT([** $with_mkimage/usr/share/mkimage exists])
				    fi
				    ],
				    [
				     MKI_PREFIX=''
				     ])
AC_ARG_WITH(clamavdb,
	    AC_HELP_STRING([--with-clamavdb=file:///path/to/database],
			   [custom clamav db for livecd, e.g '--with-clamavdb=/var/mirror/clamav']),
			   [
			    AC_MSG_CHECKING([clamavdb])
				    CLAMAV_DB="$with_clamavdb"
				    ],
				    [
				     CLAMAV_DB='http://database.clamav.net/'
				     ])


AC_ARG_WITH(imagetype,
	    AC_HELP_STRING([--with-imagetype=type],
			   [select type of result image, 'iso' or 'flash'; e.g '--with-imagetype=iso']),
			   [
			    AC_MSG_CHECKING([imagetype])
			    if test -n "$with_imagetype"  ; then
				    if test "$with_imagetype" = 'iso' -o "$with_imagetype" = 'flash'; then
					    IMAGETYPE="$with_imagetype"
					    AC_MSG_RESULT([** image type: $IMAGETYPE])
			    	    else
				    	    echo "WARNING: image type $with_imagetype is unknown, use 'iso' by default"
					    IMAGETYPE="iso"
				    fi
			    fi
			    ],
			    [
			     IMAGETYPE='iso'
			     ])


AC_ARG_WITH(squashfs-version,
	    AC_HELP_STRING([--with-squashfs-version=N],
			   [select squashfs version; e.g '--with-squashfs-version=3'])
				     )
SQUASHFS_VERSION=${with_squashfs_version:-4}

AS_VAR_SET([TOPDIR], [`dirname $(realpath $0)`])

AC_SUBST(APTCONF)
AC_SUBST(OUTDIR)
AC_SUBST(MKI_PREFIX)

AC_SUBST(ARCH)
AC_SUBST(CLAMAV_DB)
AC_SUBST(KERNEL)
AC_SUBST(KERNEL_MOD)
AC_SUBST(KERNEL_VER)
AC_SUBST(KERNEL_FLAVOUR)
AC_SUBST(KERNEL_RELEASE)
AC_SUBST(KERNEL_REL)
AC_SUBST(I586_ONLY)

AC_SUBST(LANGUAGE)
AC_SUBST(LOCALE)
AC_SUBST(LABEL)

AC_SUBST(DISTRO)
AC_SUBST(BRANDING)
AC_SUBST(BRAND)
AC_SUBST(DESIGN)
AC_SUBST(FEATURES)
AC_SUBST(DEFAULT_ISO)
AC_SUBST(ISOLINUX_DEFAULT)

AC_SUBST(BRANCH)
AC_SUBST(VERSION)
AC_SUBST(INSTALLER)

AC_SUBST(DOCS)
AC_SUBST(NODOCS)
AC_SUBST(APTCONF_PACKAGE)

AC_SUBST(IMAGETYPE)

AC_SUBST(SQUASHFS_VERSION)

AC_SUBST(TOPDIR)

AC_CONFIG_FILES([
		 Makefile
		 globals.mk
		 images.mk
		 use.mk
		 profiles/Makefile
		 profiles/addon/Makefile
		 profiles/live/Makefile
		 profiles/main/Makefile
		 profiles/kernel-pae/Makefile
		 profiles/install2/Makefile
		 profiles/isolinux/common
		 profiles/isolinux/install
		 profiles/contrib/Makefile
		 profiles/rescue/Makefile
		 profiles/ltsp/Makefile
		 profiles/pkg/lists/asterisk-devel
		 profiles/pkg/lists/base
		 profiles/pkg/lists/base-server
		 profiles/pkg/lists/contrib
		 profiles/pkg/lists/disk-dvd
		 profiles/pkg/lists/disk-dvd-gnome
		 profiles/pkg/lists/disk-dvd-kde
		 profiles/pkg/lists/disk-server
		 profiles/pkg/lists/disk-server-light
		 profiles/pkg/lists/docs
		 profiles/pkg/lists/emulators
		 profiles/pkg/lists/gnome-base
		 profiles/pkg/lists/gnome-addons
		 profiles/pkg/lists/gnome-workbench
		 profiles/pkg/lists/graphics-editing
		 profiles/pkg/lists/install2
		 profiles/pkg/lists/kde
		 profiles/pkg/lists/kde3
		 profiles/pkg/lists/kde3-lite
		 profiles/pkg/lists/kde-lite
		 profiles/pkg/lists/kernel
		 profiles/pkg/lists/kernel-pbx
		 profiles/pkg/lists/kernel-server
		 profiles/pkg/lists/network
		 profiles/pkg/lists/office-superlite
		 profiles/pkg/lists/office-server
		 profiles/pkg/lists/school-server
		 profiles/pkg/lists/pspo
		 profiles/pkg/lists/pspo-kde
		 profiles/pkg/lists/pspo-gnome
		 profiles/pkg/lists/rescue
		 profiles/pkg/lists/server
		 profiles/pkg/lists/server-light
		 profiles/pkg/lists/slinux-network
		 profiles/pkg/lists/xfce
		 profiles/pkg/lists/xfce-network-lite
		 profiles/pkg/lists/xfce-office-lite
		 profiles/pkg/lists/xorg
		 profiles/scripts.d/02-gfxboot
		 profiles/scripts.d/05-copydocs
		 tests/tests.d/contents
		 tests/Makefile 
		 ])
AC_OUTPUT
