%include 'in_out.asm'

section .data
  msg      db "Как Вас зовут?", 0h
  filename db "name.txt", 0h
  filemsg  db "Меня зовут ", 0h
  filemsg_len equ $-filemsg

section .bss
  username resb 255

section .text
  global _start

_start:
  ; Вывели на экран сообщение
  mov     eax, msg
  call    sprintLF
  
  ; Запись введённой с клавиатуры строки в переменную username
  mov     ecx, username
  mov     edx, 255
  call    sread

  ; Создание файла name.txt
  mov    ecx, 0664o
  mov    ebx, filename
  mov    eax, 8 ; sys_creat
  int    80h

  ; Открываем созданный файл для записи
  mov    ecx, 2 ; Режим открытия файла для записи
  mov    ebx, filename
  mov    eax, 5 ; sys_open
  int    80h

  ; Запись дескриптора файла в esi
  mov    esi, eax
  
  ; Записываем в файл сообщение "Меня зовут "
  mov    edx, filemsg_len
  mov    ecx, filemsg
  mov    ebx, esi
  mov    eax, 4 ; sys_write
  int    80h

  ; Вычисляем длинну сообщения, введённого пользователем
  mov    eax, username
  call   slen

  ; Записываем в файл имя пользователя
  mov    edx, eax
  mov    ecx, username
  mov    ebx, esi
  mov    eax, 4 ; sys_write
  int    80h

  ; Закрывваем файл
  mov    ebx, esi
  mov    eax, 6 ; sys_close
  int    80h
  
  call   quit
  
