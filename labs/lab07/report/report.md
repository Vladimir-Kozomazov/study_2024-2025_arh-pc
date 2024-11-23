---
## Front matter
title: "Команды безусловного и условного переходов в NASM. Программирование ветвлений"
subtitle: "Лабораторная работа №7"
author: "Владимир Романович Козомазов"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
# mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

  * Изучение команд условного и безусловного переходов в языке ассемблера NASM и приобретение навыков написания программ с использованием ветвлений.

  * Знакомство с назначением и структурой файла листинга.

# Выполнение лабораторной работы

## Описание выполняемого задания
* Написать программу, реализующую безусловный переход `jmp` в NASM и изменить ее в соответствии с заданием.

* Написать программу, реализующую условный переход `jg` в NASM и вычисляющую максимум из трех чисел, два из которых заданы, а третье вводится с клавиатуры. Получить файл листинга и исследовать его стуктуру.

## Выполнение заданий лабораторной работы 

### Реализация переходов в NASM
  Создал каталог для программы лабораторной работы №7 и перешёл в него. (рис. [-@fig:01])

  ![создание каталога для лабораторной работы и создание файла `lab7-1.asm`](image/01.png){#fig:01}

  Ввёл код в файл `lab7-1.asm` из листинга 7.1 (рис. [-@fig:02])

  ![Ввод кода в файл `lab7-1.asm` из листинга](image/02.png){#fig:02}

  Cкомпилировал и запустил программу `lab7-1` (рис. [-@fig:03])

  ![Компиляция и запуск программы `lab7-1`](image/03.png){#fig:03}

  Изменил код порграммы `lab7-1` из листинга 7.2 (рис. [-@fig:04])

  ![Изменение кода программы `lab7-1`](image/04.png){#fig:04}

  Скомпилировал и запустил программу `laab7-1` с кодом из листинга 7.2 (рис. [-@fig:05])

  ![Компиляция и запуск программы `lab7-1`](image/05.png){#fig:05}

  Изменил код программы `lab7-1`, чтобы вывод программы соответствовал заданию (рис. [-@fig:06])

  ![Изменение кода программы `lab7-1` в соответствии с заданием](image/06.png){#fig:06}

  Снова скомпилировал и запустил программу `lab7-1` и получил результаты, соответсвующие заданию (рис. [-@fig:07])

  ![Запуск программы `lab7-1` и получение результатов, соответствующих заданию](image/07.png){#fig:07}

  Создал файл `lab7-2.asm` и записал код из листинга 7.3 (рис. [-@fig:08])

  ![Создание файла`lab7-2.asm` и запись в него кода](image/08.png){#fig:08}

  Скомпилировал и запустил программу `lab7-2` с кодом из листинга 7.3 (рис. [-@fig:09])

  ![Компиляция и запуск программы `lab7-2`, проверка работы программы для разных значчений В](image/09.png){#fig:09}

### Изучение структуры файла листинга

  Создал файл листинга `lab7-2.lst` и открыл его при помощи текстового редактора mcedit (рис. [-@fig:10])

  ![Создание файла листинга `lab7-2.lst` и его открытие](image/10.png){#fig:10}

  ### Объяснение трех строк файла листинга
  
  Cтрока листинга 1:
  
  ```asm
  %include 'in_out.asm'
  ```
  
  Эта строка является макрокомандой включения файла, она включает весь код из файла `in_out.asm` в файл `lab7-2.asm`, что мы и видим в файле листинга (рис. [-@fig:11])

  ![Объяснение строки 1 в файле листинга `lab7-2.lst`](image/11.png){#fig:11}
  
  Строка листинга 194:
  
  ```asm
  mov ecx, B
  ```
  
  Данная строка соответствует строке 20 исходного файла (номер строки нааходится в столбце 1). Далее в столбце 2 находится адрес смещения (offset). В столбце 3 находится машинный код выполняемой инструкции и данные, а в столбце 4 находится собственно сам ассемблерный код (рис. [-@fig:12])
  
  ![Объяснение строки 194 в файле листинга `lab7-2.lst`](image/12.png){#fig:12}

  Строка листинга 206:
  
  ```asm
  jg check_B
  ```
  
  В первом столбце этой строки находится номер строки исходного файла, во втором столбце находится адрес смещения, в третьем столбце находится машинный код выполняемой инструкции, а в четвертом столбце собственно сам ассемблерный код (рис. [-@fig:13])

  ![Объяснение строки 206 в файле листинга `lab7-2.lst`](image/13.png){#fig:13}


### Трансляия кода программы и изучение листинга с ошибкой
  
  Изменил инструкцию `cmp`, удалив один операнд в файле `lab7-2.asm` (рис. [-@fig:14])

  ![Удаление операнда в инструкции `cmp` в файле `lab7-2.asm`](image/14.png){#fig:14}

  Выполнил трансляцию с получением файла листига (рис. [-@fig:15])

  ![Создание листинга для файла `lab7-2.asm` с ошибкой](image/15.png){#fig:15}

  Проверил листинг файла `lab7-2.asm`, созданный с ошибкой и заметил изменения данных в листинге (рис. [-@fig:16]). В листинге добавилась строка с данными об ошибке.

  ![Открытие листинга файла `lab7-2.asm`, созданный с ошибкой](image/16.png){#fig:16}

  Вывод: когда в ассемблерном коде допущена ошибка, то при трансляции объектный файл не создается, а выводится сообщение об ошибке. Файл листинга создается и в него выводится строка с данными об ошибке. 

## Выводы по результатам выполнения заданий лабораторной работы

  При выполнении заданий лабораторной работы были написаны программы, с помощью которых были изучены инструкции безусловного и условного переходов. Также были получен файл листиинга и изучена его структура. 

# Выполнение самостоятельного задания

## Описание выполняемого самостоятельного задания

  Задание для самостоятельной работы состоит из двух частей:
  * Написать программу нахождения наименьшего из трех целых чисел.
  * Написать программу вычисления функции $$f(x) = \left\{\begin{gathered}a-7,~a \ge 7 \\ ax,~a < 7 \end{gathered}\right.$$ в зависимости от вводимого с клавиатуры значения $x$ и параметра $a$.

## Выполнение заданий для самостоятельной работы

### Выполнение задания 1

  Для программы нахождения наименьшего из трех чисел создал файл `lab7_min_of_three.asm` и ввел в него код (рис. [-@fig:17])

  ![Написание программы `lab7_min_of_three.asm`](image/17.png){#fig:17}

  Проверил работу программы `lab7_min_of_three` на данных из задания (рис. [-@fig:18])

  ![Проверка работы программы `lab7_min_of_three.asm`](image/18.png){#fig:18}

### Выполнение задания 2

  Для программы вычисления функции $f(x)$ создал файл `lab7_calc_function.asm` и ввел в него соответствующий код (рис. [-@fig:19])

  ![Написание программы `lab7_calc_function.asm`](image/19.png){#fig:19}

  Проверка работы программы `lab7_calc_function` на данных из задания (рис. [-@fig:20])

  ![Проверка работы программы `lab7_calc_function.asm`](image/20.png){#fig:20}

## Выводы по результатам выполнения самостоятельного задания

  В ходе выполнения самостоятельного задания были написаны программы, которые вычисляют наименьшее из трех чисел и вычисляют функцию $f(x)$ в зависимости от вводимого с клавиатуры значения $x$ и параметра $a$. Были использованы методы сравнения и ветвлений, освоенные в ходе выполнения лабораторной работы.

# Выводы

  * В ходе выполнения лаборатороной работы были изучены команды безусловного и условного переходов в языке ассемблера NASM, приобретены навыки написания программ с использованием ветвлений, а также написаны несколько программ, использующих ветвления.

  * При трансляции программы был получен файл листинга, изучено  содержание файла листинга и его структура.

# Листинги написанных программ

## Программа `lab7-1.asm`

```asm
%include 'in_out.asm'

SECTION .data
  msg1: DB 'Сообщение № 1',0
  msg2: DB 'Сообщение № 2',0
  msg3: DB 'Сообщение № 3',0

SECTION .text
  GLOBAL _start
  _start:

  jmp _label3

  _label1:
    mov eax, msg1
    call sprintLF
    jmp _end

  _label2:
    mov eax, msg2
    call sprintLF
    jmp _label1

  _label3:
    mov eax, msg3
    call sprintLF
    jmp _label2

  _end:
   call quit
```
## Программа `lab7-2.asm`

```asm
%include 'in_out.asm'

SECTION .data
  msg1 DB "Введите В: ",0h
  msg2 DB "Наибольшее число: ",0h
  A dd "20"
  C dd "50"

SECTION .bss
  max resb 10
  B   resb 10

SECTION .text
  global _start

  _start:
    mov eax, msg1
    call sprint

    mov ecx, B
    mov edx, 10
    call sread

    mov eax, B
    call atoi
    mov [B], eax

    mov ecx, [A]
    mov [max], ecx

    cmp ecx,
    jg check_B
    mov ecx,[C]
    mov [max],ecx

  check_B:
    mov eax, max
    call atoi
    mov [max], eax

    mov ecx, [max]
    cmp ecx, [B]
    jg fin
    mov ecx, [B]
    mov [max], ecx

  fin:
    mov eax, msg2
    call sprint
    mov eax, [max]
    call iprintLF
    call quit
```

## Программа `lab7_min_of_three.asm`

```asm
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
```

## Программа `lab7_calc_function.asm`

```asm
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
```