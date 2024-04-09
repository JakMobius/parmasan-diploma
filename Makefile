.PHONY: all FORCE

all: presentation diploma

presentation: FORCE
	cd presentation && make

diploma: FORCE
	cd diploma && make

FORCE:
