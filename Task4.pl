#!/usr/bin/perl
use strict;
use warnings;

# Задание 4: Лексикографически упорядоченный список лексем на основе хеш-массива

my %my_hash = (
    "ФИО" => "Иванов И.И.",
    "Курс" => "4",
    "Группа" => "96вп3"
);  # Инициализация хеша примером из теоретической части
my @sorted_keys = sort keys %my_hash;  # Упорядоченный список ключей

# Функция добавления лексемы
sub add_lexeme {
    my ($key, $value) = @_;
    
    # Проверка, существует ли ключ
    if (exists $my_hash{$key}) {
        print "Лексема '$key' уже существует. Обновить значение? (y/n): ";
        chomp(my $choice = <STDIN>);
        return if $choice ne 'y';
    }
    
    # Добавление или обновление пары ключ-значение
    $my_hash{$key} = $value;
    
    # Обновление упорядоченного списка ключей
    @sorted_keys = sort keys %my_hash;
    print "Лексема '$key' добавлена/обновлена.\n";
}

# Функция удаления лексемы
sub delete_lexeme {
    my ($key) = @_;
    
    if (!exists $my_hash{$key}) {
        print "Лексема '$key' не найдена.\n";
        return;
    }
    
    # Удаление лексемы
    delete $my_hash{$key};
    
    # Обновление упорядоченного списка ключей
    @sorted_keys = sort keys %my_hash;
    print "Лексема '$key' удалена.\n";
}

# Функция просмотра списка
sub view_list {
    if (!%my_hash) {
        print "Список пуст.\n";
        return;
    }
    
    print "Список лексем:\n";
    foreach my $key (@sorted_keys) {
        print "$key => $my_hash{$key}\n";
    }
}

# Основное меню
while (1) {
    print "\nМеню:\n";
    print "1. Добавить лексему\n";
    print "2. Удалить лексему\n";
    print "3. Просмотреть список\n";
    print "0. Выход\n";
    print "Выберите опцию: ";
    chomp(my $choice = <STDIN>);
    
    last if $choice eq '0';
    
    if ($choice eq '1') {
        print "Введите ключ лексемы: ";
        chomp(my $key = <STDIN>);
        print "Введите значение лексемы: ";
        chomp(my $value = <STDIN>);
        add_lexeme($key, $value);
    } elsif ($choice eq '2') {
        print "Введите ключ лексемы для удаления: ";
        chomp(my $key = <STDIN>);
        delete_lexeme($key);
    } elsif ($choice eq '3') {
        print "Список лексем:\n";
        view_list();
    } else {
        print "Неверный выбор.\n";
    }
}