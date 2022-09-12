import 'package:library_flutter/domain/models/Publisher/publisher.dart';

class Book {
  dynamic id;
  dynamic name;
  dynamic author;
  dynamic realeaseYear;
  dynamic quantity;
  Publisher? publisher;

  Book({
    this.id,
    required this.name,
    required this.author,
    required this.realeaseYear,
    required this.quantity,
    required this.publisher,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    author = json['autor'];
    realeaseYear = json['lancamento'];
    quantity = json['quantidade'];
    publisher = json['editora'] != null
        ? Publisher.fromJson(
            json['editora'],
          )
        : null;
  }
}
