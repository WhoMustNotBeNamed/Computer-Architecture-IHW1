# Печать содержимого регистра как целого
.macro print_int(%x)
        li      a7, 1
        mv      a0, %x
        ecall
.end_macro

# Ввод целого числа с консоли в регистр a0
.macro read_int_a0
        li       a7, 5
        ecall
.end_macro

# Ввод целого числа с консоли в указанный регистр, исключая регистр a0
.macro read_int(%x)
        push     (a0)
        li       a7, 5
        ecall
        mv       %x, a0
        pop      (a0)
.end_macro

# Вывод строки 
.macro print_str(%x)
   .data
str:
        .asciz   %x
   .text
        push     (a0)
        li       a7, 4
        la       a0, str
        ecall
        pop      (a0)
.end_macro

# Вывод символа
.macro print_char(%x)
    li       a7, 11
    li       a0, %x
    ecall
.end_macro

# Новая строка
.macro newline
        print_char('\n')
.end_macro

# Сохранение заданного регистра на стеке
.macro push(%x)
    addi    sp, sp, -4
    sw      %x, (sp)
.end_macro

# Выталкивание значения с вершины стека в регистр
.macro pop(%x)
    lw      %x, (sp)
    addi    sp, sp, 4
.end_macro

# Очистка регистра
.macro clean(%x)
	li	%x 0
.end_macro

# Вызов подпрограммы, которая читаем n
.macro input_n(%x)
	la	t4 %x			# Адрес n в t4
	jal     input_n	
.end_macro

# Вызов подпрограммы, которая читаем вводимый массив
.macro input_arr(%x, %y)
	la	t0 %x			# Указатель элемента массива
 	lw	t3 %y			# Число элементов массива
	jal	input_arr	
.end_macro

# Вызов подпрограммы, которая ищет минимальный элемент массива
.macro find_min(%n, %min, %array)
	la	t0 %array		# Указатель элемента массива
	lw	t3 %n			# Число элементов массива
	la	t6 %min		        # Адрес min_number в t4
	jal	find_min	
.end_macro

# Вызов подпрограммы, которая создает массив B
.macro create_new_array(%n, %array_A, %array_B, %min)
	la	t0 %array_A		# Указатель элемента массива A
	la	t1 %array_B		# Указатель элемента массива B
	lw	t3 %n			# Число элементов массива
	lw	t4 %min			# Адрес min_number в t4
	jal	create_new_array	
.end_macro

# Вызов подпрограммы, которая выводит результат
.macro output(%x, %y)
	la	t1 %x                   # Указатель элемента массива B
	lw	t3 %y			# Число элементов массива
	jal     output
.end_macro

# Запрос на повторный запуск программы
.macro repeat
	print_str("\nIf you want to exit, enter 0. Otherwise, enter another number   ")
	read_int(t1)		        # Чтение ответа
	newline
	bnez 	t1 main		        # Повторный запуск	
.end_macro

# Добавление элемента в массив
.macro array_add(%x, %y)
	li 	a0 %x
	sw 	a0(%y)
	addi 	%y %y 4
.end_macro

# Завершение программы
.macro exit
	li      a7, 10
	ecall
.end_macro
