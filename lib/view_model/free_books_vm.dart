import 'package:bookstore/view_model/book_vm.dart';
import 'package:bookstore/model/book_store.dart';
import 'package:bookstore/model/book.dart';
import 'package:flutter/cupertino.dart';

final class FreeBooksVM {
  late final BookStore _bookStore;
  final bookList = ValueNotifier<List<BookVM>>([]);

  get count => bookList.value.length;

  FreeBooksVM(this._bookStore) {
    _bookStore.freeBooks.addListener(_loadBooks);
    _loadBooks();
  }

  void dispose() {
    _bookStore.freeBooks.removeListener(_loadBooks);
  }

  void _loadBooks() {
    List<BookVM> newList = [];
    for (var book in _bookStore.freeBooks.value) {
      newList.add(
        BookVM(book, 'Взять', () {
          _borrowBook(book);
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

  void _borrowBook(Book book) {
    _bookStore.borrowBook(book);
  }
}
