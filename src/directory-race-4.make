all: build build/a.out

build:
    mkdir -p build

build/a.out:
    echo "a" > build/a.out
