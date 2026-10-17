#!/bin/sh
set -e

echo "=== КОМПИЛЯЦИЯ ВСЕХ ЗАДАЧ ==="

echo "1. Компиляция Задачи 1 (Мандельброт)..."
cd /mnt/c/Users/Админ/Desktop/лаба/task1_mandelbrot
gcc -O3 -Wall -pthread main.c -o program -lm

echo "2. Компиляция Задачи 2 (N тел)..."
cd /mnt/c/Users/Админ/Desktop/лаба/task2_nbody
gcc -O3 -Wall -pthread main.c -o program -lm

echo "3. Компиляция Задачи 3 (Свой и стандартный rwlock)..."
cd /mnt/c/Users/Админ/Desktop/лаба/task3_rwlock
gcc -O3 -Wall -pthread my_rand.c pth_ll_rwl.c -o pth_std
gcc -O3 -Wall -pthread -DUSE_MY_RWLOCK my_rand.c my_rwlock.c pth_ll_rwl.c -o pth_custom

echo ""
echo "=== ТЕСТОВЫЕ ЗАПУСКИ ==="
echo "Задача 1: 4 потока, 2000 точек"
cd /mnt/c/Users/Админ/Desktop/лаба/task1_mandelbrot
./program 4 2000

echo ""
echo "Задача 2: 4 потока, t=5.0, шаг dt=0.01"
cd /mnt/c/Users/Админ/Desktop/лаба/task2_nbody
./program 5.0 input.txt 4 0.01

echo ""
echo "Задача 3: сравнение rwlock (4 потока, 100 000 операций)"
cd /mnt/c/Users/Админ/Desktop/лаба/task3_rwlock
./pth_std 4 1000 100000 0.8 0.1
./pth_custom 4 1000 100000 0.8 0.1

echo ""
echo "Все задачи успешно скомпилированы и протестированы!"
