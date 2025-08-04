# MY First OS

A simple x86 bootloader that prints "Hello OS" using BIOS interrupts. Built with NASM and tested using QEMU.

# Features

->16-bit Real Mode
->BIOS interrupt 0x10 (Teletype mode)
-> Prints a null-terminated string

# Build & Run

# Requirments
->NASM (version 2.16.03)
->QEMU  (version 10.0.2)
->GNU Make 

# Build manually

--bash--
nasm -f bin src/boot.asm -o build/boot.img

#Run with QEMU
qemu-system-x86_64 build/boot.img
