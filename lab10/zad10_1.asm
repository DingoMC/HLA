.486
.model flat, stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
.const
.data
tekst_tytulu db "Sonda studencka", 0
tekst_komunikatu db "Czy zrozumiales zasady tworzenia komunikatow?", 0
tekst_tak db "Mozemy zatem przejsc do nastepnej czesci", 0
tekst_nie db "Szkoda, cwicz wiecej", 0
tekst_anuluj db "Nie odpowiedziales na pytanie", 0
.data?
.code
nasz_program:
invoke MessageBox, 0, addr tekst_komunikatu, addr tekst_tytulu, MB_YESNOCANCEL or MB_ICONQUESTION
.IF EAX == IDYES
    invoke MessageBox, 0, addr tekst_tak, addr tekst_tytulu, MB_OK or MB_ICONEXCLAMATION
.ELSEIF EAX == IDNO
    invoke MessageBox, 0, addr tekst_nie, addr tekst_tytulu, MB_ICONEXCLAMATION
.ELSEIF EAX == IDCANCEL
    invoke MessageBox, 0, addr tekst_anuluj, addr tekst_tytulu, MB_ICONHAND
.ENDIF
invoke ExitProcess, 0
end nasz_program