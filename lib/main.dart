import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'books_screen.dart';
import 'books_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BooksController controller = Get.put(BooksController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Books App',
      home: BooksScreen(),
    );
  }
}
