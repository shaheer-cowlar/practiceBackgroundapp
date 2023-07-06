import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'books_controller.dart';

class BooksScreen extends StatelessWidget {
  final BooksController controller = Get.find<BooksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            final book = controller.books[index];
            return ListTile(
              title: Text(book.name),
              subtitle: Text(book.type),
            );
          },
        ),
      ),
    );
  }
}
