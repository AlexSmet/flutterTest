import 'package:bookstore/service/service_locator.dart';
import 'package:bookstore/view_model/book_vm.dart';
import 'package:bookstore/view_model/free_books_vm.dart';
import 'package:flutter/material.dart';

final class FreeBooks extends StatelessWidget {
  const FreeBooks({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<FreeBooksVM>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Свободные книги'),
      ),
      body: Center(
        child: 
        ValueListenableBuilder<List<BookVM>>(
            valueListenable: viewModel.bookList,
            builder: (_, list, __) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var itemViewModel = viewModel.getBookAtIndex(index);
                  return ListTile(
                    title: Text(itemViewModel!.name),
                    trailing: TextButton(
                      onPressed: itemViewModel.onTapButton,
                      child: Text(itemViewModel.buttonText),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: viewModel.count,
              );
            }),
      ),
    );
  }
}
