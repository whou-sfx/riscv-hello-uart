ARCH    = riscv32-unknown-elf
CC      = $(ARCH)-gcc
FLAGS   = -nostartfiles -g
LD      = $(ARCH)-ld
OBJCOPY = $(ARCH)-objcopy


all: clean hello.img

hello.img: hello.elf
	$(OBJCOPY) hello.elf -I binary hello.img

hello.elf: hello.o link.ld Makefile
	$(LD) -T link.ld -o hello.elf hello.o

hello.o: hello.s
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -f *.o hello.elf hello.img

run: hello.img
	qemu-system-riscv32 -M virt -bios none -serial stdio -display none -kernel hello.img

