#!/usr/bin/perl
use strict;
use warnings;

# Задание 1: Объединение, пересечение, разность, симметричная разность двух массивов

print "Введите элементы первого массива (по одному на строку, Ctrl+D для завершения):\n";
chomp(my @arr1 = <>);

print "Введите элементы второго массива (по одному на строку, Ctrl+D для завершения):\n";
chomp(my @arr2 = <>);

# Преобразование в множества с использованием хешей для уникальности
my %set1 = map { $_ => 1 } @arr1;
my %set2 = map { $_ => 1 } @arr2;

# Объединение (union)
my %union_hash = (%set1, %set2);
my @union = sort keys %union_hash;

# Пересечение (intersection)
my @intersection = sort grep { exists $set2{$_} } keys %set1;

# Разность (difference: arr1 - arr2)
my @difference = sort grep { !exists $set2{$_} } keys %set1;

# Симметричная разность (symmetric difference)
my @sym_diff_ab = sort grep { !exists $set2{$_} } keys %set1;
my @sym_diff_ba = sort grep { !exists $set1{$_} } keys %set2;
my @symmetric_difference = sort (@sym_diff_ab, @sym_diff_ba);

# Вывод результатов
print "\nОбъединение: @union\n";
print "Пересечение: @intersection\n";
print "Разность (первый минус второй): @difference\n";
print "Симметричная разность: @symmetric_difference\n";
