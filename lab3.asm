.MODEL flat, stdcall
OPTION CASEMAP:NONE ;���������������� � ��������
Include kernel32.inc
Include masm32.inc
IncludeLib kernel32.lib
IncludeLib masm32.lib
.CONST
	ZaprosA DB 13,10,'Input A',13,10,0
	ZaprosB DB 13,10,'Input B',13,10,0
	ResultCount DB 'Count = ', 0
    Space DB ' ',0
	NewLine DB  13, 10, 0
.DATA
	ResStr DB 16 DUP (' '),0

.DATA?
	A DWORD ?
	B DWORD ?
	COUNT DWORD ?
	E DWORD ?

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


; �-------------------
; ����� ���������
; �-------------------
mov edx, A
mov E, edx
mov COUNT, 0


lp:
	cmp edx, B
	jg exit
	inc COUNT
	mov ResStr, 0
	Invoke StdOut,ADDR Space ;
	Invoke dwtoa,E,ADDR ResStr ;
	Invoke StdOut,ADDR ResStr ;
	add E, 1
	mov edx, E
	
	jmp lp


exit:
	Invoke StdOut,ADDR NewLine ;
	mov ResStr, 0
	Invoke StdOut,ADDR ResultCount
	Invoke dwtoa,COUNT,ADDR ResStr ;
	Invoke StdOut,ADDR ResStr ;����� ������




Invoke ExitProcess,0 ;����� � ����� 0
End Start