all: library_1 ... library_9

library_1:
    %\colorbox{yellow}{mkdir -p build}%
    build_library build/lib1.a
...

library_9:
    %\colorbox{yellow}{mkdir -p build}%
    build_library build/lib9.a