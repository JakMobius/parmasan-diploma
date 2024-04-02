all: compile link

compile:
	gcc main.c -o main.o
	gcc lib.c -o lib.o

link:
	gcc main.o lib.o -o a.out
