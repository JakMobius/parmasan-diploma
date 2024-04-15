all: lib1 ... lib9

lib1:
	mkdir -p build
	build_library build/lib1.a
...

lib9:
	mkdir -p build
	build_library build/lib9.a