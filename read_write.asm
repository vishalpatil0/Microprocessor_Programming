section .data
msg1 db 10,"Enter the number ",10
msg1_len equ $-msg1
msg2 db 10,"Entered number is = "
msg2_len equ $-msg2

section .bss
num resb 10

section .text

global _start

_start:
	mov eax,04
	mov ebx,01
	mov ecx,msg1
	mov edx,msg1_len
	int 80h
	
	mov eax,03
	mov ebx,00
	mov ecx,num
	mov edx,10
	int 80h
	
	mov eax,04
	mov ebx,01
	mov ecx,msg2
	mov edx,msg2_len
	int 80h
	
	mov eax,04
	mov ebx,01
	mov ecx,num
	mov edx,10
	int 80h
	
	mov eax,01
	mov ebx,00
	int 80h
