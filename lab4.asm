 #include <iostream>
using namespace std;
int main()
{
	const int N = 3;
	int source_mass[N];
	int result_mass[N];
	int count = 3;

	for (int i = 0; i < N; i++)
	{
		cout << "mass[" << i << "]="; cin >> source_mass[i];
	}
	
	_asm
	{
		mov ecx, N
		lea esi, source_mass;смещение source_mass
		lea edi, result_mass;смещение result_mass
		l:
			mov eax, [esi]
			add esi, 4
			mov ebx, [esi]
			sub eax, ebx
			mov [edi], eax
			add edi, 4
			loop l

	}
	for (int i = 0; i <N-1; i++)
	{
		cout << "result_mass[" << i << "]=" <<result_mass[i] << endl;
	}
}