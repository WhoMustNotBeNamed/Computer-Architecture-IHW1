.global create_new_array

create_new_array:
	sw		t4 (t1)			# Загрузка first_number в массив B
	lw		t5 first_number	# Адрес first_number в t5
	addi	t0 t0 4			# Увеличим адрес на размер слова в байтах в A
	addi	t1 t1 4			# Увеличим адрес на размер слова в байтах в B
	addi	t3 t3 -1		# Уменьшим количество оставшихся элементов на 1
	
loop:	
	lw		t6 (t0)			# Вытаскиваем элемент массива и кладем его в t5
	beq 	t6 t4 swap		# Если t6 == min_number, меняем элементы местами
back3:	
	sw		t6 (t1)			# Загрузка элемента в массив B
	addi	t0 t0 4			# Увеличим адрес на размер слова в байтах
	addi	t1 t1 4			# Увеличим адрес на размер слова в байтах в B
	addi	t3 t3 -1		# Уменьшим количество оставшихся элементов на 1
	bnez	t3 loop			# Если осталось больше 0
	clean(t0)				# Очистка t0
	clean(t1)				# Очистка t1
	clean(t2)				# Очистка t1
	clean(t3)				# Очистка t3
	clean(t4)				# Очистка t4
	clean(t5)				# Очистка t5
	clean(t6)				# Очистка t6
	ret

# Меняем элементы местами
swap:	
	bgtz	t2 back3
	mv		t6 t5
	addi	t2 t2 1
	j		back3
