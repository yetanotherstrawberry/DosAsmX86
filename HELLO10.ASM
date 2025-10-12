; Simple program that prints 'Hello, World!' ten times each in a new line under DOS written in x86 assembly.
; (c) 2025 yetanotherstrawberry

org 0x100 ; Set offset beyond .COM file header.

section .text ; Begin code section.
   global _start ; Define entry point for the linker.

   _start:
      mov ch, 10 ; Store loop counter in CH.
      inc ch ; Increment loop counter by 1 as is is decremented before checking it.

   _check:
      dec ch ; Decrement CH for iteration. DEC sets the ZF (Zero Flag) if the result is equal to 0.
      jnz _loop ; Jump to _loop if ZF is not set.
      mov ah, 0x0 ; DOS: Exit program - function 0x0.
      int 0x21 ; DOS: API call - interrupt 0x21.

   _loop:
      mov ah, 0x9 ; DOS: Print to console - function 0x9.
      lea dx, hello ; DOS: Set string - set DX to $-terminated string in memory.
      int 0x21 ; DOS: API call - interrupt 0x21.
      jmp _check ; Jump to _check.

section .data ; Begin data section.
   hello db 'Hello, World!',0xd,0xa,'$' ; Store 'Hello, World!\r\n$' as hello.
