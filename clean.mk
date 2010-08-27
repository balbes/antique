.PHONY: clean distclean clean-lists

# Remove all auto generated configs
define clean-configs
@echo "Remove all auto generated configs..."
rm -f $(foreach stage,$(STAGES),"$(call scfg,$(stage))")
rm -f "$(AUTOCFG)"
rm -rf "$(DONEDIR)"
endef

# purge profiles/*/$(STAGECFG), regenerate $(AUTOCFG)
rinse:
	for i in profiles/{,install2/,main/,live/,addon/}$(STAGECFG); do :>$$i; done
	rm -f $(AUTOCFG)
	$(MAKE) $(AUTOCFG)

clean distclean:
	make -C profiles rm-loader
	SUBDIRS="$(STAGES)" make -C profiles $@
	$(clean-configs)
