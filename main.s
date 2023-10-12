.include "macrolib.s"
.include "input_n.s"
.include "input_arr.s"
.include "find_min.s"
.include "create_new_array.s"
.include "output.s"

.global main

main:
.data
	.align  2				# Выравнивание на границу слова
	n:              .word	0		# Число введенных элементов массива
	array_A:        .space 64		# Массив А
	array_B:        .space 64		# Массив B
	min_number:     .word	0		# Минимальное значение
	first_number:	.word	0		# Первый элемент массива
.text
	input_n(n)				# Ввод числа элементов массива (указатель на переменную, в которую сохраним n)        

	print_str ("Input numbers: ")
	newline
	input_arr(array_A, n)			# Ввод массива (указатель на массив и число элементов)
	
	# Нахождение минимального и первого элемента (указатель на число элементов, переменную для хранения и массив)
	find_min(n, min_number, array_A)		
	lw	s1 min_number			# Кладем минимальное значение в s1		
	lw	s2 first_number			# Кладем первый элемент в s2
	print_str("min number = ")
	print_int(s1)
	print_str("\nfirst number = ")
	print_int(s2)
	
	# Создаем массив B
	create_new_array(n, array_A, array_B, min_number)
	newline
	output(array_B, n)			# Выводим массив в консоль (указатель на массив и число элементов)
	newline       		
	
	repeat					# Запрос на повторный запуск программы
	print_str("--------")			# Строка-разделитель (с \n и нулём в конце) 
	exit					# Завершение программы
