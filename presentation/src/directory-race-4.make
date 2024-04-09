all: build build/file.out

build:
    mkdir -p build

build/a.out:
    echo "a" > build/a.out
