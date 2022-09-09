import 'dart:convert';
import 'package:library_flutter/models/Publisher/publisher.dart';
import 'package:http/http.dart' as http;

class PublishersRepository {
  final String _baseUrl = "http://localhost:5000/api/v3";

  Future<List<Publisher>> getAll() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Editora'));

      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedBody = jsonDecode(response.body);
        final body = (decodedBody as List);
        final data = body.map((item) => Publisher.fromJson(item)).toList();

        return data;
      }
    } catch (err) {
      return List.empty();
    }
  }

  Future<void> post(Publisher publisher) async {
    await http.post(
      Uri.parse('$_baseUrl/Editora'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {'nome': publisher.name, 'cidade': publisher.city},
      ),
      encoding: Encoding.getByName("utf-8"),
    );
  }

  Future<void> put(Publisher publisher) async {
    await http.put(
      Uri.parse('$_baseUrl/Editora/${publisher.id}'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {'id': publisher.id, 'nome': publisher.name, 'cidade': publisher.city},
      ),
      encoding: Encoding.getByName("utf-8"),
    );
  }
}
