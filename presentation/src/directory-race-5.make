all: lib1 ... lib9

lib1:
	%\colorbox{yellow}{mkdir -p build}%
	build_library build/lib1.a
...

lib9:
	%\colorbox{yellow}{mkdir -p build}%
	build_library build/lib9.a