.PHONY: all

exes = perf-test-nop perf-test-mul perf-test-div

all: $(exes)

perf-test-%: perf-test-%.o
	ld $< -o $@

%.o: %.s
	nasm -f elf64 $<

clean:
	rm -f *.o
	rm -f $(exes)
