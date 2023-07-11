import 'package:bookstore/model/book.dart';

final class BookVM {
  late final Book book;
  String get name => book.name;
  late final String buttonText;
  late Function()? onTapButton;

  BookVM(Book book, this.buttonText, this.onTapButton) {
    this.book = book;
  }
}