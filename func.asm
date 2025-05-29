; ============================================
; void Exit()
; ============================================

exit:
    mov ebx, 0
    mov eax, 1
    int 80h
    ret

; ============================================
; Int atoi(String ascii) ~ ASCii to Integer
; ============================================

atoi:
    push ecx
    push ebx
    push esi

    mov esi, eax
    mov ecx, 0
    mov eax, 0

.charsplit:
    xor ebx, ebx
    mov bl, [esi + ecx]
    cmp bl, 48
    jl .break
    cmp bl, 57
    jg .break

    sub bl, 48
    add eax, ebx
    mov ebx, 10
    mul ebx

    inc ecx
    jmp .charsplit

.break:
    cmp ecx, 0
    jz .finish
    mov  ebx, 10
    div  ebx
    
.finish:
    pop esi
    pop ebx
    pop ecx
    ret

; ============================================
; Int strlen(String str)
; ============================================

strlen:
    push ebx
    mov ebx, eax
.continue:
    cmp byte[eax], 0h
    jz .break 
    inc eax
    jmp .continue
.break:
    sub eax, ebx    
    pop ebx
    ret

; ============================================
; void linefeedOUT() ~ \n (next line)
; ============================================

linefeedOUT:
    push eax
    mov eax, 0Ah
    
    push eax
    mov eax, esp
    call strOUT
    pop eax

    pop eax
    ret

; =======================================================
; void strIN(Buffer Ptr, Int Size) ~ Str Console Input
; =======================================================

strIN:
    push edx
    push ecx
    push ebx
    push eax

    mov edx, ebx
    mov ecx, eax
    mov ebx, 0
    mov eax, 3
    int 80h

    pop eax
    pop ebx
    pop ecx
    pop edx
    ret

; ============================================
; void strOUT(String Msg) ~ Print
; ============================================

strOUT:
    push edx
    push ecx
    push ebx
    push eax

    call strlen

    mov edx, eax
    pop eax

    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 80h

    pop ebx
    pop ecx
    pop edx
    ret

; ============================================
; void strOUTn(String Msg) ~ Print + \n
; ============================================

strOUTn:
    call strOUT
    call linefeedOUT
    ret

; =======================================================
; void numIn(Buffer ptr, Int Size) ~ Num Console Input
; =======================================================

numIN:
    call strIN
    call atoi
    ret

; ============================================
; void numOUT(Integer num) ~ Print Num
; ============================================

numOUT:
    push edx
    push ecx
    push ebx
    push eax

    mov ebx, 0
.continueDiv:
    inc ebx

    mov edx, 0
    mov ecx, 10
    
    idiv ecx
    add  edx, 48
    push edx

    cmp eax, 0
    jnz .continueDiv

.continuePrint:
    dec ebx

    mov eax, esp
    call strOUT
    pop eax

    cmp ebx, 0
    jnz .continuePrint

    pop eax
    pop ebx
    pop ecx
    pop edx
    ret

; ============================================
; void numOUTn(Integer num) ~ Print Num + \n
; ============================================

numOUTn:
    call numOUT
    call linefeedOUT
    ret