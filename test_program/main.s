.include "macrolib.s"
.include "find_min.s"
.include "create_new_array.s"
.include "output.s"

.global main

main:
.data
	.align  2				# Выравнивание на границу слова
	n1:              .word	0		# Число введенных элементов массива
	array_A1:       .space 64		# Массив А
	array_B1:       .space 64		# Массив B
	min_number1:	.word	0		# Минимальное значение
	first_number:	.word 0			# Первый элемент массива
	
	n2:              .word	0		# Число введенных элементов массива
	array_A2:        .space 64		# Массив А
	array_B2:        .space 64		# Массив B
	min_number2:     .word	0		# Минимальное значение
	
	n3:              .word	0		# Число введенных элементов массива
	array_A3:        .space 64		# Массив А
	array_B3:        .space 64		# Массив B
	min_number3:     .word	0		# Минимальное значение

	n4:              .word	0		# Число введенных элементов массива
	array_A4:        .space 64		# Массив А
	array_B4:        .space 64		# Массив B
	min_number4:     .word	0		# Минимальное значение

.text	
	print_str("Test #1")
	newline
	print_str("n = 5")
	newline
	# Инициализация n
	la	t4 n1	
	li 	a0 5					
	sw	a0 (t4)
	print_str("Array A: [3 5 1 2 4]")
	newline
	print_str("Expected result [1 5 3 2 4]")
	la	t4 array_A1
	array_add(3, t4)
	array_add(5, t4)
	array_add(1, t4)
	array_add(2, t4)
	array_add(4, t4)
	clean(t4)
	clean(a0)	
	find_min(n1, min_number1, array_A1)
	create_new_array(n1, array_A1, array_B1, min_number1)			
	newline
	output(array_B1, n1)					
	newline
	print_str("______________")
	newline
	
	print_str("Test #2")
	newline
	print_str("n = 5")
	newline
	# Инициализация n
	la	t4 n2
	li 	a0 5
	sw	a0 (t4)
	print_str("Array A: [2 8 -1 3 -4]")
	newline
	print_str("Expected result [-4 8 -1 3 2]")
	la	t4 array_A2
	array_add(2, t4)
	array_add(8, t4)
	array_add(-1, t4)
	array_add(3, t4)
	array_add(-4, t4)
	clean(t4)
	clean(a0)	
	find_min(n2, min_number2, array_A2)
	create_new_array(n2, array_A2, array_B2, min_number2)
	newline
	output(array_B2, n2)					
	newline
	print_str("______________")
	newline
	
	print_str("Test #3")
	newline
	print_str("n = 3")
	newline
	# Инициализация n
	la	t4 n3
	li 	a0 3
	sw	a0 (t4)
	print_str("Array A: [2 1 1]")
	newline
	print_str("Expected result [1 2 1]")
	la	t4 array_A3
	array_add(2, t4)
	array_add(1, t4)
	array_add(1, t4)
	clean(t4)
	clean(a0)	
	find_min(n3, min_number3, array_A3)
	create_new_array(n3, array_A3, array_B3, min_number3)				
	newline
	output(array_B3, n3)
	newline
	print_str("______________")
	newline

	print_str("Test #4")
	newline
	print_str("n = 3")
	newline
	# Инициализация n
	la	t4 n4
	li 	a0 3
	sw	a0 (t4)
	print_str("Array A: [1 2 3]")
	newline
	print_str("Expected result [1 2 3]")
	la	t4 array_A4
	array_add(1, t4)
	array_add(2, t4)
	array_add(3, t4)
	clean(t4)
	clean(a0)	
	find_min(n4, min_number4, array_A4)
	create_new_array(n4, array_A4, array_B4, min_number4)				
	newline
	output(array_B4, n4)
	
	exit				# Завершение программы
