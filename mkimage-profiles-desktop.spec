Name: mkimage-profiles-desktop
Version: 5.0.0
Release: alt7

Summary: Profiles for build various distributions ISO images
License: GPLv2+ 
Group: Development/Other
Requires: mkimage

Packager: Anton V. Boyarshinov <boyarsh@altlinux.ru>
BuildArch: noarch
Source:%name-%version.tar

%description
This packages contents profiles for building ALTLinux Desktop and Server distributions

%prep
%setup -q

%install
# create directory structure
mkdir -p $RPM_BUILD_ROOT/usr/share/mkimage/profiles-desktop
cp -a *	$RPM_BUILD_ROOT/usr/share/mkimage/profiles-desktop
rm $RPM_BUILD_ROOT/usr/share/mkimage/profiles-desktop/*spec

%files
/usr/share/mkimage/profiles-desktop
%exclude /usr/share/mkimage/profiles-desktop/tests

%changelog
* Sat Nov 14 2009 Denis Koryavov <dkoryavov@altlinux.org> 5.0.0-alt7
- Simply linux 5.0.0 final.

* Mon Sep 07 2009 Denis Koryavov <dkoryavov@altlinux.org> 5.0.0-alt6
 - Added settings for build Simply GNU/Linux.

* Thu Apr 30 2009 Anton V. Boyarshinov <boyarsh@altlinux.ru> 5.0.0-alt5
- successfull built on Sisyphus 

* Mon Mar 30 2009 Anton V. Boyarshinov <boyarsh@altlinux.ru> 5.0.0-alt4
- office server merged into profiles
- many fixes from ldv@

* Fri Mar 27 2009 Anton V. Boyarshinov <boyarsh@altlinux.ru> 5.0.0-alt3
- gfxboot fixed
- version, displayed by propagator fixed
- lxde version added
- tests not packaged

* Thu Mar 26 2009 Anton V. Boyarshinov <boyarsh@altlinux.ru> 5.0.0-alt2
- 'White labeling' rewrited
- sample build script

* Tue Mar 24 2009 Anton V. Boyarshinov <boyarsh@altlinux.ru> 5.0.0-alt1
- beta profile for 5.0.0  

* Sun Jan 27 2008 Anton V. Boyarshinov <boyarsh@altlinux.ru> 4.0.3-alt1
- 4.0.3 release 

* Fri Dec 28 2007 Anton V. Boyarshinov <boyarsh@altlinux.ru> 4.0.2-alt3
- 4.0.2 release

* Sat Dec 15 2007 Anton V. Boyarshinov <boyarsh@altlinux.ru> 4.0.2-alt2
- version of school deadline 

* Wed Dec 12 2007 Anton V. Boyarshinov <boyarsh@altlinux.ru> 4.0.2-alt1
- first build
