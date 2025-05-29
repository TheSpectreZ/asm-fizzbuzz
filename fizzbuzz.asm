%include "func.asm"

SECTION .data
InputMsg1   db "Enter Start Number: ", 0h
InputMsg2   db "Enter End Number: ", 0h

InvalidMsg  db "Start Number must be lower than End Number!", 0h

Fizz        db "Fizz", 0h
Buzz        db "Buzz", 0h

SECTION .bss
consoleInput: resb 255

SECTION .text
global _start

fizzbuzz:
    push edx
    push ecx
    push ebx
    push eax
    push esi

    mov ebx, edx
    inc ebx         ; To include the ending number

.continue:
    mov eax, ebx

    sub eax, ecx
    cmp eax, 0
    jz .break

.checkFizz:
    xor edx, edx
    mov eax, ecx
    mov esi, 3
    
    div esi
    cmp edx, 0
    
    mov eax, 0
    jnz .checkBuzz

    mov eax, Fizz
    call strOUT
    mov eax, 1

.checkBuzz:
    push eax

    xor edx, edx
    mov eax, ecx
    mov esi, 5

    div esi
    cmp edx, 0
    
    pop eax
    jnz .checkNum
    
    mov eax, Buzz
    call strOUT
    jmp .increment

.checkNum:

    cmp eax, 1
    jz .increment

    mov eax, ecx
    call numOUT

.increment:
    call linefeedOUT
    inc ecx
    jmp .continue

.break:
    pop esi
    pop eax
    pop ebx
    pop ecx
    pop edx
    ret

_start:
    mov eax, InputMsg1
    call strOUT

    mov eax, consoleInput
    mov ebx, 255
    call numIN
    mov ecx, eax

    mov eax, InputMsg2
    call strOUT

    mov eax, consoleInput
    mov ebx, 255
    call numIN   
    mov edx, eax    
                    
    cmp edx, ecx
    jg .valid

    mov eax, InvalidMsg
    call strOUTn
    
    jmp _start

.valid:
    call fizzbuzz   ; ecx has start and edx has end
    call exit