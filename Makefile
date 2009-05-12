VERSION = `grep '^;;; Version:' tap-mode.el | cut -d: -f2 | sed 's/ //g'`
DISTNAME = tap-mode-$(VERSION)

all:
	@echo Nothing to do. Try make dist.

dist:
	@mkdir -p $(DISTNAME)
	@V=$(VERSION) ; echo VERSION: $$V
	@V=$(VERSION) perl -pni -e 's/^ version: \d+\.\d+/ version: $$ENV{V}/' META.yml
	@cp tap-mode.el README ChangeLog META.yml $(DISTNAME)/
	@tar czf $(DISTNAME).tgz $(DISTNAME)
	@/bin/rm -fr $(DISTNAME)

clean:
	/bin/rm -f tap-mode-?.?.tgz
