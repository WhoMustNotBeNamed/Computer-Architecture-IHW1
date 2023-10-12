.global output

output:
	print_str("Array B: ")
out:	
	lw		t5 (t1)        	# Вытаскиваем элемент массива и кладем его в t5
	print_int(t5)			# Выводим элемент массива
	addi	t1 t1 4			# Увеличим адрес на размер слова в байтах в B
	addi	t3 t3 -1		# Уменьшим количество оставшихся элементов на 1
	print_str(" ")
	bnez	t3 out			# Если осталось больше 0
	clean(t1)				# Очистка t1
	clean(t3)				# Очистка t3
	clean(t5)				# Очистка t5
	ret
