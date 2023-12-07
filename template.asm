.386
.MODEL FLAT

INCLUDE IO.h
ExitProcess PROTO stdcall, dwExitCode:DWORD
printf PROTO c : ptr sbyte , :vararg


.STACK 4096

.DATA
msg byte "hello world",0


.CODE 
_start:
	;output msg
	INVOKE printf, OFFSET msg
	INVOKE ExitProcess ,0
PUBLIC _start
END _start