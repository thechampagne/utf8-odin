ODIN ?= odin

all:
	$(ODIN) build test -collection:shared="." -extra-linker-flags:"-L. -l:./utf8.a" -out:main
	./main

clean:
	rm ./main