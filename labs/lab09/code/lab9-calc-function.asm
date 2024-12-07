%include "in_out.asm"

section .data
  msg1    db "Функция: f(x) = 12x - 7", 0h
  msg2    db "Результат: ", 0h

section .text
  global _start

_start:
  ; Обрабатываем аргументы командной строки
  pop    ecx
  pop    edx
  sub    ecx, 1
  mov    esi, 0

  ; Создаём цикл для вычисления значений функции f(x) при разных
  ; значениях х, получаемых из командной строки
next:
  cmp    ecx, 0
  jz     _end
  pop    eax
  call   atoi
  ; Вычисляем значение функции с помощью подпрограммы
  call _calc
  ; Увеличили сумматор на вычисленное значение функции
  add    esi, eax
  loop   next

_end:
  mov    eax, msg1
  call   sprintLF
  mov    eax, msg2
  call   sprint
  mov    eax, esi
  call   iprintLF
  call quit

; Подпрограмма вычисления занчения функции
_calc:
  imul   eax, 12
  sub    eax, 7
  ret 
