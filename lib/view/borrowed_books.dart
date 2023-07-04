import 'package:bookstore/service/service_locator.dart';
import 'package:bookstore/view/free_books.dart';
import 'package:bookstore/view_model/book_vm.dart';
import 'package:bookstore/view_model/borrowed_books_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final class BorrowedBooks extends StatelessWidget {
  const BorrowedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<BorrowedBooksVM>();
    // viewModel.loadBooks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Взятые книги'),
      ),
      body: ValueListenableBuilder<List<BookVM>>(
          valueListenable: viewModel.bookList,
          builder: (_, list, __) {
            return ListView.separated(
              itemBuilder: (context, index) {
                var itemViewModel = viewModel.getBookAtIndex(index);
                return ListTile(
                  title: Text(itemViewModel!.name),
                  trailing: TextButton(
                    onPressed: itemViewModel!.onTapButton,
                    child: Text(itemViewModel.buttonText),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: viewModel.count,
              scrollDirection: Axis.vertical,
            );
          }),
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FreeBooks()),
            );
          },
          child: const Text('Взять новую книгу'),
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}
