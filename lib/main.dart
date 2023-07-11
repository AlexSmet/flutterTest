import 'package:bookstore/service/service_locator.dart';
import 'package:bookstore/view/borrowed_books.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BorrowedBooks()
    );
  }
}
