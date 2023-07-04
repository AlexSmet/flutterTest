import 'package:bookstore/view_model/book_vm.dart';
import 'package:bookstore/model/book_store.dart';
import 'package:bookstore/model/book.dart';
import 'package:flutter/material.dart';

final class BorrowedBooksVM {
  late final BookStore _bookStore;
  final bookList = ValueNotifier<List<BookVM>>([]);

  get count => bookList.value.length;

  BorrowedBooksVM(this._bookStore) {
    _bookStore.borrowedBooks.addListener(_loadBooks);
    _bookStore.loadBooks();
  }

  void dispose() {
    _bookStore.borrowedBooks.removeListener(_loadBooks);
  }

  void _loadBooks() {
    List<BookVM> newList = [];
    for (var book in _bookStore.borrowedBooks.value) {
      newList.add(
        BookVM(book, 'Сдать', () {
          _returnBook(book);
        }),
      );
    }
    newList.sort((a, b) => a.name.compareTo(b.name));
    bookList.value = newList;
  }

  BookVM? getBookAtIndex(int index) {
    if (index < 0 || index >= bookList.value.length) {
      return null;
    } else {
      return bookList.value[index];
    }
  }

  void _returnBook(Book book) {
    _bookStore.returnBook(book);
  }
}
