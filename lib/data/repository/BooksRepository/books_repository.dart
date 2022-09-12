import 'dart:convert';
import 'package:library_flutter/domain/models/Book/book.dart';
import 'package:http/http.dart' as http;

class BooksRepository {
  final String _baseUrl = "http://localhost:5000/api/v3";

  Future<List<Book>> getAll() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Livro'));

      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedBody = jsonDecode(response.body);
        final body = (decodedBody as List);
        final data = body.map((item) => Book.fromJson(item)).toList();

        return data;
      }
    } catch (err) {
      return List.empty();
    }
  }

  Future<void> post(Book book) async {
    await http.post(
      Uri.parse('$_baseUrl/Livro'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {
          'nome': book.name,
          'autor': book.author,
          'lancamento': int.parse(book.realeaseYear),
          'quantidade': int.parse(book.quantity),
          'editoraId': int.parse(book.publisher!.id),
        },
      ),
      encoding: Encoding.getByName("utf-8"),
    );
  }

  Future<void> put(Book book) async {
    await http.put(
      Uri.parse('$_baseUrl/Livro/${book.id}'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {
          'id': book.id,
          'nome': book.name,
          'autor': book.author,
          'lancamento': book.realeaseYear,
          'quantidade': book.quantity,
          'editoraId': book.publisher!.id
        },
      ),
      encoding: Encoding.getByName("utf-8"),
    );
  }

  Future<void> delete(Book book) async {
    await http.delete(
        Uri.parse(
          '$_baseUrl/Livro/${book.id}',
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        encoding: Encoding.getByName("utf-8"));
  }
}
