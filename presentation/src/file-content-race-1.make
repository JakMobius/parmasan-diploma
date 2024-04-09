all: write_a append_b

write_a:
	echo 'a' > file.out

append_b: %\phantom{\colorbox{yellow}{write\_a}}%
	echo 'b' >> file.out
