.model flat,c
.code
; extern "C" int CalcSum_(int a , int b , int c)
; ����: ���������ʾ�������c++�ͻ�����Ժ���֮�䴫�ݲ���
; ����ֵ : a + b + c
CalcSum_ proc
; ��ʼ��ջָ֡��
    push ebp
    mov ebp , esp
; ���ز���ֵ
    mov eax , [ebp + 8] ; eax = a
    mov ecx , [ebp + 12] ; ecx = b
    mov edx , [ebp + 16] ; edx = c
; ���
    add eax , ecx ; eax = a + b
    add eax , edx ; eax = a + b + c
; �ָ���������ջָ֡��
    pop ebp
    ret
CalcSum_ endp
end