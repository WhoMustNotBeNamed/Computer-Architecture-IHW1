.global input_n

input_n:
.text
	# Подсказка для ввода числа элементов массива
	print_str("Enter the number of array elements from 1 to 10: ")
	read_int(t3)				# Сохраняем результат в t3 (это n)			
	j		check_n
back1:	
	sw		t3 (t4)				# Загрузка n в память на хранение
	clean(t3)					# Очистка t3
	clean(t4)					# Очистка t4
	ret							# Выход из подпрограммы

# Проверка вводимого числа n
check_n:
	ble		t3 zero wrong_n		# На ошибку, если меньше 0
	li		t2 10				# Размер массива
	bgt		t3 t2 wrong_n		# На ошибку, если больше 10
	clean(t2)					# Очистка t4
	j		back1
wrong_n:
	print_str("Incorrect n!")
	newline
	clean(t2)					# Очистка t4
	j		input_n
