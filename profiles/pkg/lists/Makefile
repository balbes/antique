clean:
	rm -f *~ *.bak
	make -C ../tags clean

check:
	../../../bin/check-pkg-list [^M]*[^.][^i][^n]

check.in:
	../../../bin/check-pkg-list [^M]*.in

tags:
	PKGDIR=$(GLOBAL_PKGDIR) ../../../bin/lists2tags [^M]*
