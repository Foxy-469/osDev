#For buiding and running the bootloader

SRC = src/boot.asm
OUT = build/boot.img

all: $(OUT)

$(OUT): $(SRC)
	mkdir -p build
	nasm -f bin $(SRC) -o $(OUT)

run: all
	qemu-system-x86_64 $(OUT)

clean:
	rm -rf build
