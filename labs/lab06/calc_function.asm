%include 'in_out.asm'

SECTION .data
  msg:     DB 'Вычисление значения функции (8х + 6) * 10',0
  request: DB 'Введите значение х: ',0
  answer:  DB 'Результат: ',0

SECTION .bss
  x:       RESB 80 ; Значение, которое вводит пользователь
  buf1:    RESB 80 ; Промежуточная переменная для хранения результата вычислений

SECTION .text
  GLOBAL _start
  _start:

  ; Выводим пользователю выражение для вычисления
  mov eax,msg
  call sprintLF

  ; Выводими запрос на ввод значения с клавиатуры
  mov eax,request
  call sprint

  ; Организуем ввод данных с клавиатуры
  mov ecx,x
  mov edx,80
  call sread

  ; Преобразуем значение, введённое пользователем, в число
  mov eax,x
  call atoi

  ; Вычисляем выражение
  mov ebx,8
  mul ebx
  mov ebx,6
  add eax,ebx
  mov ebx,10
  mul ebx

  ; Сохраняем результат вычислений в переменную buf1
  mov [buf1],eax

  ; Выводим результат вычисления пользователю
  mov eax,answer
  call sprint
  mov eax,[buf1]
  call iprintLF

  call quit
