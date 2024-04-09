all: file.out write_a append_b
file.out:
    touch file.out
    ln -f file.out hardlink_a
    ln -f file.out hardlink_b

write_a: file.out
    echo 'a' > hardlink_a

append_b: file.out
    echo 'b' >> hardlink_b