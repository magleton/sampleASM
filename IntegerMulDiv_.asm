.model flat,c
.code
; extern "C" int IntegerMulDiv_(int a , int b , int *prod , int *quo , int *rem);
;
; ����: ���������ʾ��imul��idivָ����÷�, Ҳ��ʾ��ָ����÷�
; ����ֵ: 
; 0 Error (������0)
; 1 Success (������0)
;
; ����: 
; *prod = a * b
; *quo = a / b
; *rem = a % b

IntegerMulDiv_ proc
; ��������
	push ebp
	mov ebp , esp
	push ebx
; ȷ��������Ϊ 0
	xor eax , eax			; ���ô��󷵻���
	mov ecx , [ebp + 8]		; ecx = a
	mov edx , [ebp + 12]	; edx = b
	or edx , edx
	jz InvalidDivisor		; ��aΪ0 ��ת
; �������������
	imul edx , ecx			; edx = a * b
	mov  ebx , [ebp + 16]	; ebx = prod
	mov  [ebx] , edx
; �����̺����� , ��������
	mov eax , ecx			; eax = a
	cdq						; edx:eax ����������
	idiv dword ptr [ebp + 12]	; eax = quo , edx = rem
	mov ebx , [ebp + 20]		; ebx = quo
	mov [ebx] , eax				; ������
	mov ebx , [ebp + 24]		; ebx = rem
	mov [ebx] , edx				; ��������
	mov eax , 1					; ���óɹ�������
; ��������
	InvalidDivisor:
		pop ebx
		pop ebp
		ret
IntegerMulDiv_ endp
end