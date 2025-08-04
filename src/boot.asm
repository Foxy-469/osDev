; boot.asm - prints "Hello OS"

BITS 16
ORG 0x7C00

start:
	; si in source inder register
	mov si, msg		;Load the address of msg string into SI

print_char:
	lodsb			; Load [SI] into AL, then SI++
	or al, al		;Check if AL is zero (end of str)
	jz hang			;If so, jump to halt loop
	mov ah, 0x0E		;BIOS: Teletype mode
	int 0x10		;Call BIOS to print AL
	jmp print_char 		;Go to next char
	
hang:
	cli			;Clear interrupts
	hlt 			;Halt CPU
	jmp hang		;Infinite loop

msg db 'Hello OS', 0		;Null-terminated string
times 510 - ($ -$$) db 0	;Pad to 510 bytes
dw 0xAA55			;Boot signature

