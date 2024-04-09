all: something something_else

something:
    generate_something > tmp_file
    do_something_with tmp_file
    rm tmp_file

something_else:
    generate_something_else > tmp_file
    do_something_else_with tmp_file
    rm tmp_file