# prefix pkglist name with its directory to form a path
list = $(1:%=$(GLOBAL_PKGDIR)/lists/%)

# prefix/suffix group name to form a path
group = $(1:%=$(GLOBAL_PKGDIR)/groups/%.directory)

# transform a list of tags into a list of pklist paths
taggedlistnames = $(shell TAGDIR=$(GLOBAL_PKGDIR)/tags $(TOPDIR)/bin/tags2lists $(1))
tagged = $(addprefix $(GLOBAL_PKGDIR)/lists/,$(taggedlistnames))
