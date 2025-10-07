#!/usr/bin/perl
use strict;
use warnings;

# Задание 4: Лексикографически упорядоченный список лексем на основе хеш-массива

my %hash = ("enter" => "");  # Initialize linked list with sentinel node

# Функция добавления лексемы
sub add_lexeme {
    my ($new_string) = @_;
    my $prev = "enter";
    my $current = $hash{$prev};

    # Traverse to find insertion point
    while ($current && $current lt $new_string) {
        $prev = $current;
        $current = $hash{$current};
    }

    # Check for duplicate
    if ($current && $current eq $new_string) {
        print "Лексема '$new_string' уже существует.\n";
        return;
    }

    # Insert new lexeme
    $hash{$prev} = $new_string;
    $hash{$new_string} = $current;
    print "Лексема '$new_string' добавлена.\n";
}

# Функция удаления лексемы
sub delete_lexeme {
    my ($del_string) = @_;
    my $prev = "enter";
    my $current = $hash{$prev};

    # Traverse to find lexeme to delete
    while ($current && $current ne $del_string) {
        $prev = $current;
        $current = $hash{$current};
    }

    if ($current) {
        $hash{$prev} = $hash{$current};
        delete $hash{$current};
        print "Лексема '$del_string' удалена.\n";
    } else {
        print "Лексема '$del_string' не найдена.\n";
    }
}

# Функция просмотра списка
sub view_list {
    my $current = $hash{"enter"};
    if (!$current) {
        print "Список пуст.\n";
        return;
    }

    print "Список лексем:\n";
    my %visited;  # Track visited nodes to prevent loops
    while ($current && !$visited{$current}) {
        print "$current\n";
        $visited{$current} = 1;
        $current = $hash{$current};
    }
}

# Основное меню
while (1) {
    print "\nМеню:\n";
    print "1. Добавить лексему\n";
    print "2. Удалить лексему\n";
    print "3. Просмотреть список\n";
    print "4. Выход\n";
    print "Выберите действие: ";
    chomp(my $choice = <STDIN>);

    if ($choice == 1) {
        print "Введите лексему для добавления: ";
        chomp(my $new_string = <STDIN>);
        add_lexeme($new_string) if $new_string;  # Only add non-empty strings
    } elsif ($choice == 2) {
        print "Введите лексему для удаления: ";
        chomp(my $del_string = <STDIN>);
        delete_lexeme($del_string) if $del_string;  # Only attempt to delete non-empty strings
    } elsif ($choice == 3) {
        view_list();
    } elsif ($choice == 4) {
        print "Выход.\n";
        last;
    } else {
        print "Неверный выбор. Попробуйте снова.\n";
    }
}