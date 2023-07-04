import 'package:bookstore/view_model/free_books_vm.dart';
import 'package:get_it/get_it.dart';
import 'package:bookstore/model/book_store.dart';
import 'package:bookstore/view_model/borrowed_books_vm.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Model
  getIt.registerSingleton<BookStore>(BookStore());

  // ViewModels
  BookStore bookStore = getIt<BookStore>();
  getIt.registerSingleton<BorrowedBooksVM>(BorrowedBooksVM(bookStore));
  getIt.registerSingleton<FreeBooksVM>(FreeBooksVM(bookStore));
}