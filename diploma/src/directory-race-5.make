all: lib1 lib2

lib1:
	mkdir -p build
	build_library build/lib1.a

lib2:
	mkdir -p build
	build_library build/lib2.a