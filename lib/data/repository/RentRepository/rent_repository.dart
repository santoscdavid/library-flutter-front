import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_flutter/domain/models/Rent/rent.dart';

class RentRepository {
  final String _baseUrl = "http://localhost:5000/api/v3";

  Future<List<Rent>> getAll() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Aluguel'));

      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedBody = jsonDecode(response.body);
        final body = (decodedBody as List);
        final data = body.map((item) => Rent.fromJson(item)).toList();

        return data;
      }
    } catch (err) {
      return List.empty();
    }
  }

  Future<void> post(Rent rent) async {
    await http.post(
      Uri.parse('$_baseUrl/Aluguel'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {
          'aluguelFeito': rent.rentStart,
          'previsaoEntrega': rent.rentEnd,
          'devolucao': rent.devolution,
          'livroId': int.parse(rent.book!.id),
          'usuarioId': int.parse(rent.customer!.id),
        },
      ),
      encoding: Encoding.getByName("utf-8"),
    );
  }

  Future<http.Response> put(Rent rent) async {
    return await http.put(
      Uri.parse('$_baseUrl/Aluguel/${rent.id}'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {
          'id': rent.id,
          'aluguelFeito': rent.rentStart,
          'previsaoEntrega': rent.rentEnd,
          'devolucao': rent.devolution,
          'livroId': rent.book!.id,
          'usuarioId': rent.customer!.id,
        },
      ),
      encoding: Encoding.getByName("utf-8"),
    );
  }

  // TODO: Ajustar retorno
  Future<void> delete(Rent rent) async {
    await http.delete(
        Uri.parse(
          '$_baseUrl/Aluguel/${rent.id}',
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        encoding: Encoding.getByName("utf-8"));
  }
}
