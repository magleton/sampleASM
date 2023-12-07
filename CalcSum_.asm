.model flat,c
.code
; extern "C" int CalcSum_(int a , int b , int c)
; 描述: 这个函数演示了如何在c++和汇编语言函数之间传递参数
; 返回值 : a + b + c
CalcSum_ proc
; 初始化栈帧指针
    push ebp
    mov ebp , esp
; 加载参数值
    mov eax , [ebp + 8] ; eax = a
    mov ecx , [ebp + 12] ; ecx = b
    mov edx , [ebp + 16] ; edx = c
; 求和
    add eax , ecx ; eax = a + b
    add eax , edx ; eax = a + b + c
; 恢复父函数的栈帧指针
    pop ebp
    ret
CalcSum_ endp
end