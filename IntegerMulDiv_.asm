.model flat,c
.code
; extern "C" int IntegerMulDiv_(int a , int b , int *prod , int *quo , int *rem);
;
; 描述: 这个函数演示了imul和idiv指令的用法, 也演示了指针的用法
; 返回值: 
; 0 Error (除数是0)
; 1 Success (除数是0)
;
; 计算: 
; *prod = a * b
; *quo = a / b
; *rem = a % b

IntegerMulDiv_ proc
; 函数序言
	push ebp
	mov ebp , esp
	push ebx
; 确保除数不为 0
	xor eax , eax			; 设置错误返回码
	mov ecx , [ebp + 8]		; ecx = a
	mov edx , [ebp + 12]	; edx = b
	or edx , edx
	jz InvalidDivisor		; 若a为0 跳转
; 计算积并保存结果
	imul edx , ecx			; edx = a * b
	mov  ebx , [ebp + 16]	; ebx = prod
	mov  [ebx] , edx
; 计算商和余数 , 并保存结果
	mov eax , ecx			; eax = a
	cdq						; edx:eax 包含被除数
	idiv dword ptr [ebp + 12]	; eax = quo , edx = rem
	mov ebx , [ebp + 20]		; ebx = quo
	mov [ebx] , eax				; 保存商
	mov ebx , [ebp + 24]		; ebx = rem
	mov [ebx] , edx				; 保存余数
	mov eax , 1					; 设置成功返回码
; 函数结语
	InvalidDivisor:
		pop ebx
		pop ebp
		ret
IntegerMulDiv_ endp
end