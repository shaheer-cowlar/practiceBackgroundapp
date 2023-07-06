import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Book {
  final int id;
  final String name;
  final String type;
  final bool available;

  Book({
    required this.id,
    required this.name,
    required this.type,
    required this.available,
  });

  factory Book.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // Handle null case or return a default book instance
      return Book(
        id: 0,
        name: 'Unknown',
        type: 'Unknown',
        available: false,
      );
    }

    return Book(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      available: json['available'],
    );
  }
}
class BooksController extends GetxController {
  final books = <Book>[].obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      fetchBooks();
    });
  }

  void fetchBooks() async {
    try {
      final response = await http.get(Uri.parse('https://simple-books-api.glitch.me/books'));
      if (response.statusCode == 200) {
        print('seucess');
        final List<dynamic> jsonArray = jsonDecode(response.body);
        final List<Book> fetchedBooks = jsonArray
            .map((json) => Book.fromJson(json))
            .toList();
        books.assignAll(fetchedBooks);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}