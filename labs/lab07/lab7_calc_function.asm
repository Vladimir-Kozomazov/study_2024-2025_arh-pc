%include "in_out.asm"

section .data
  msg_input_x   db    "Введите x: ", 0h
  msg_input_a   db    "Введите a: ", 0h
  msg_result    db    "Результат: ", 0h

section .bss
  x             resb  10
  a             resb  10
  result        resb  10

section .text
  global _start

_start:
  ; Запрашиваем значение переменной x
  mov    eax, msg_input_x
  call   sprint
  ; Организуме ввод с клавиатуры значения переменной a
  mov    ecx, x
  mov    edx, 10
  call   sread
  ; Преобразуем строку, полученную с клавиатуры, в число
  mov    eax, x
  call   atoi
  mov    [x], eax

  ; Запрашиваем значение переменной a
  mov    eax, msg_input_a
  call   sprint
  ; Организуме ввод с клавиатуры значения переменной b
  mov    ecx, a
  mov    edx, 10
  call   sread
  ; Преобразуем строку, полученную с клавиатуры, в число
  mov    eax, a
  call   atoi
  mov    [a], eax

  ; Сравниваем а и 7
  mov    ecx, [a]
  cmp    ecx, 7
  jl     a_lower_7
  ; Если a >= 7, то result = a - 7
  mov    eax, [a]
  sub    eax, 7
  mov    [result], eax
  jmp    fin

a_lower_7:
  ; Если a < 7, то result = a * x
  mov    eax, [a]
  mov    ecx, [x]
  mul    ecx
  mov    [result], eax

fin:
  ; Выводим сообщение пользователю
  mov eax, msg_result
  call sprint
  ; Печатаем результат
  mov eax, [result]
  call iprintLF

  call quit

