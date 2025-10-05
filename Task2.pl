#!/usr/bin/perl
use strict;
use warnings;

# Задание 2: Попарная перестановка элементов массива

print "Введите элементы массива (по одному на строку, Ctrl+D для завершения):\n";
chomp(my @arr = <>);

# Получение индексов
my @even_indices = grep { $_ % 2 == 0 } 0 .. $#arr;
my @odd_indices = grep { $_ % 2 == 1 } 0 .. $#arr;

# Сохранение оригинальных значений для срезов
my @even_values = @arr[@even_indices];
my @odd_values = @arr[@odd_indices];

# Присваивание в списковом контексте с использованием срезов
(@arr[@even_indices], @arr[@odd_indices]) = (@odd_values, @even_values);

# Вывод результата
print "\nМассив после попарной перестановки: @arr\n";