.MODEL flat, stdcall
OPTION CASEMAP:NONE ;чувствительность к регистру
include kernel32.inc
include masm32.inc
includeLib kernel32.lib
includeLib masm32.lib


.DATA
ZaprosA DB 13,10,'Input A',13,10,0
ZaprosB DB 13,10,'Input B',13,10,0
ZaprosC DB 13,10,'Input C',13,10,0
ZaprosD DB 13,10,'Input D',13,10,0
Result DB 'Result='
ResStr DB 16 DUP (' '),0
B WORD 5
C1 WORD 5
D WORD 3

.DATA?
A WORD ?
X WORD ?
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

Invoke StdOut,ADDR ZaprosC ;Вывод запроса
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; Ввод строки
Invoke atol,ADDR Buffer ;Строка в число EAX
mov DWORD PTR C1,EAX ;Запись числа по адресу C

Invoke StdOut,ADDR ZaprosD ;Вывод запроса
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; Ввод строки
Invoke atol,ADDR Buffer ;Строка в число EAX
mov DWORD PTR D,EAX ;Запись числа по адресу D

; —-----------------—
; Текст программы
; —-----------------—
;X=a/2+b*c*d 
mov ax, A
mov bx, 2
mov dx, 0
div bx
mov cx, ax
mov ax, B
mul C1
mul D
add cx, ax

mov X, cx

Invoke dwtoa,X,ADDR ResStr ;Число в строку
Invoke StdOut,ADDR Result ;Вывод строки
Invoke ExitProcess,0 ;Выход с кодом 0
End Start

