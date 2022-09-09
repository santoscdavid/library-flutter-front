import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:library_flutter/models/Publisher/publisher.dart';
import 'package:http/http.dart' as http;
import 'package:library_flutter/utils/global_scaffold.dart';

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
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/Editora'),
        body: jsonEncode(
          {'nome': publisher.name, 'cidade': publisher.city},
        ),
      );
      if (response.statusCode != 200) {
        throw Exception();
      } else {
        showSnackbar(const SnackBar(
          content: Text("!"),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
        ));
      }
    } catch (err) {
      print(err);
    }
  }
}
