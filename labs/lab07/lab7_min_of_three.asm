%include "in_out.asm"

section .data
  msg_input_a   db    "Введите a: ", 0h
  msg_input_b   db    "Введите b: ", 0h
  msg_input_c   db    "Введите c: ", 0h
  msg_result    db    "Наименьшее число: ", 0h

section .bss
  a             resb  10
  b             resb  10
  c             resb  10
  min           resb  10

section .text
  global _start

_start:
  ; Запрашиваем значение переменной a
  mov    eax, msg_input_a
  call   sprint
  ; Организуме ввод с клавиатуры значения переменной a
  mov    ecx, a
  mov    edx, 10
  call   sread
  ; Преобразуем строку, полученную с клавиатуры, в число
  mov    eax, a
  call   atoi
  mov    [a], eax

  ; Запрашиваем значение переменной b
  mov    eax, msg_input_b
  call   sprint
  ; Организуме ввод с клавиатуры значения переменной b
  mov    ecx, b
  mov    edx, 10
  call   sread
  ; Преобразуем строку, полученную с клавиатуры, в число
  mov    eax, b
  call   atoi
  mov    [b], eax

  ; Запрашиваем значение переменной c
  mov    eax, msg_input_c
  call   sprint
  ; Организуме ввод с клавиатуры значения переменной a
  mov    ecx, c
  mov    edx, 10
  call   sread
  ; Преобразуем строку, полученную с клавиатуры, в число
  mov    eax, c
  call   atoi
  mov    [c], eax

  ; min = a
  mov    ecx, [a]
  mov    [min], ecx

  ; Сравниваем a и b
  cmp    ecx, [b]
  ; Если a > b, то min = a и переходим
  ; к сравнению min и c
  jl     check_c
  ; Иначе min = b
  mov    ecx, [b]
  mov    [min], ecx

  ; Сравниваем min(a,b) и c
check_c:
  mov    ecx, [min]
  cmp    ecx, [c]
  ; Если min < c, то уже нашли min
  jl     fin
  ; Иначе min = c
  mov    ecx, [c]
  mov    [min], ecx

fin:
  ; Выводим сообщение пользователю
  mov    eax, msg_result
  call   sprint
  ; Выводим результат
  mov    eax, [min]
  call   iprintLF

  call quit

