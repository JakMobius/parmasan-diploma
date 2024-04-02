all: write_a append_b

write_a:
	echo 'a' > file.out

append_b: %\colorbox{yellow}{write\_a}%
	echo 'b' >> file.out
