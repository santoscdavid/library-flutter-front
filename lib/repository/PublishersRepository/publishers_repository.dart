import 'dart:convert';

import 'package:library_flutter/models/Publisher/publisher.dart';
import 'package:http/http.dart' as http;

class PublishersRepository {
  Future<List<Publisher>> getAll() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:5000/api/v3/Editora'));

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
}
