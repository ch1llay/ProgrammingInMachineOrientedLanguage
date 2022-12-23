.MODEL flat, stdcall
OPTION CASEMAP:NONE ;чувствительность к регистру
Include kernel32.inc
Include masm32.inc
IncludeLib kernel32.lib
IncludeLib masm32.lib

.CONST
	ZaprosA DB 13,10,'Input A',13,10,0
	ZaprosB DB 13,10,'Input B',13,10,0
	ResultA DB 'A = ', 0
	ResultB DB 13, 10, 'B = ', 0
.DATA
	Result DB 'Result='
	ResStr DB 16 DUP (' '),0
	

	.DATA?
	A WORD ?
	B WORD ?
	Buffer DB 10 DUP (?)
	inbuf DB 100 DUP (?)

.CODE

Start:
Invoke StdOut,ADDR ZaprosA ;Вывод запроса
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; Ввод строки
Invoke atol,ADDR Buffer ;Строка в число EAX
mov DWORD PTR A,EAX ;Запись числа по адресу А

Invoke StdOut,ADDR ZaprosB ;Вывод запроса
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; Ввод строки
Invoke atol,ADDR Buffer ;Строка в число EAX
mov DWORD PTR B,EAX ;Запись числа по адресу B


; —-------------------
; Текст программы
; —-------------------
mov ax,A
mov bx, A
mov dx, 0

cmp ax,B ; сравнение A и B
jl LESS ; переход по меньше
	;A > B
	; b=(a+b)/2
	; a = 2*a*b

	add ax, B
	mov cx, 2
	div cx

	mov bx, ax

	mov ax, A
	mov cx, 2
	mul cx
	mul B
	mov A, ax

	mov B, bx

jmp CONTINUE ; переход на конец ветвления
LESS:
; a=(a+b)/2
; b = 2*a*b
	add ax, B
	mov cx, 2
	div cx

	mov bx, ax

	mov ax, B
	mov cx, 2
	mul cx
	mul A
	mov B, ax

	mov A, bx



CONTINUE:
Invoke StdOut,ADDR ResultA
Invoke dwtoa,A,ADDR ResStr ;
Invoke StdOut,ADDR ResStr ;Вывод строки
mov ResStr, 0
Invoke StdOut,ADDR ResultB
Invoke StdOut,ADDR ResStr ;Вывод строки
Invoke dwtoa,B,ADDR ResStr ;
Invoke StdOut,ADDR ResStr ;Вывод строки
Invoke ExitProcess,0 ;Выход с кодом 0
End Start