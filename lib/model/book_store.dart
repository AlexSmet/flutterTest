import 'package:flutter/material.dart';
import 'book.dart';

class BookStore {
  final borrowedBooks = ValueNotifier<List<Book>>([]);
  final freeBooks = ValueNotifier<List<Book>>([]);

  void loadBooks() {
    borrowedBooks.value = [];

    freeBooks.value = [
      Book('Охота на овец'),
      Book('1Q84'),
      Book('Старик и море'),
      Book('Волшебная лампа Аладдина'),
      Book('Книга о вскусной и здоровой пище'),
      Book('Мертвые души'),
      Book('Ревизор'),
      Book('Воин света'),
      Book('Сто лет одиночества'),
      Book('Generation П'),
      Book('Межевой рыцарь'),
      Book('Серверное сеяние'),
      Book('Аквариум'),
      Book('Цусима'),
      Book('Битва железных канцлеров'),
    ];
  }

  void returnBook(Book book) {
    int bookIndex = borrowedBooks.value.indexOf(book);
    if (bookIndex >= 0) {
      final newList = borrowedBooks.value.toList();
      newList.removeAt(bookIndex);
      borrowedBooks.value = newList;
    }
    if (!freeBooks.value.contains(book)) {
      final newList = freeBooks.value.toList();
      newList.add(book);
      freeBooks.value = newList;
    }
  }

  void borrowBook(Book book) {
    int bookIndex = freeBooks.value.indexOf(book);
    if (bookIndex >= 0) {
      final newList = freeBooks.value.toList();
      newList.removeAt(bookIndex);
      freeBooks.value = newList;
    }
    if (!borrowedBooks.value.contains(book)) {
      final newList = borrowedBooks.value.toList();
      newList.add(book);
      borrowedBooks.value = newList;
    }
  }
}
