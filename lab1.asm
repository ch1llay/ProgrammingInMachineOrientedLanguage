.MODEL flat, stdcall
OPTION CASEMAP:NONE ;���������������� � ��������
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
Invoke StdOut,ADDR ZaprosA ;����� �������
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; ���� ������
Invoke atol,ADDR Buffer ;������ � ����� EAX
mov DWORD PTR A,EAX ;������ ����� �� ������ �

Invoke StdOut,ADDR ZaprosB ;����� �������
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; ���� ������
Invoke atol,ADDR Buffer ;������ � ����� EAX
mov DWORD PTR B,EAX ;������ ����� �� ������ B

Invoke StdOut,ADDR ZaprosC ;����� �������
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; ���� ������
Invoke atol,ADDR Buffer ;������ � ����� EAX
mov DWORD PTR C1,EAX ;������ ����� �� ������ C

Invoke StdOut,ADDR ZaprosD ;����� �������
Invoke StdIn,ADDR Buffer,LengthOf Buffer ; ���� ������
Invoke atol,ADDR Buffer ;������ � ����� EAX
mov DWORD PTR D,EAX ;������ ����� �� ������ D

; �-----------------�
; ����� ���������
; �-----------------�
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

Invoke dwtoa,X,ADDR ResStr ;����� � ������
Invoke StdOut,ADDR Result ;����� ������
Invoke ExitProcess,0 ;����� � ����� 0
End Start

