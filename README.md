# riscv-hello-uart
Minimal bare-metal RISC-V assembly code with UART output for execution in QEMU

## Requirements
### Tools:
- riscv64-unknown-elf-gcc
- riscv64-unknown-elf-ld
- riscv64-unknown-elf-objcopy

### Building:
Make

### Execution:
qemu-system-riscv64

## Building
make all

## Running
make run



## execute with ouptut asm executing flow to asm.log 
qemu-system-riscv32 -M virt -bios none -serial stdio -display none -bios hello.img -d in_asm -D asm.log


## execute with debug with gdb
qemu-system-riscv32 -M virt -bios none -serial stdio -display none -bios hello.img -s -S

## "-s" start with listen gdb debug port start from *:1234
## "-S" start with stop at 1st instruction

## run gdb in another termination
riscv32-unknown-elf-gdb hello.elf
(gdb) target extended-remote :1234
Remote debugging using :1234
0x00001000 in ?? ()

// "n" to step run
// "si" to show currnt
// "display /i $pc" to show current asm code
(gdb) display /i $pc
1: x/i $pc
=> 0x80000004 <_start+4>:       csrw    minstreth,zero



