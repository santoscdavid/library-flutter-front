import 'package:library_flutter/domain/models/Customer/customer.dart';
import 'package:library_flutter/domain/models/Book/book.dart';

class Rent {
  dynamic id;
  Book? book;
  Customer? customer;
  dynamic rentStart;
  dynamic rentEnd;
  dynamic devolution;

  Rent({
    this.id,
    required this.book,
    required this.customer,
    required this.rentStart,
    required this.rentEnd,
    required this.devolution,
  });

  Rent.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    customer =
        json["usuario"] != null ? Customer.fromJson(json["usuario"]) : null;
    book = json["livro"] != null ? Book.fromJson(json["livro"]) : null;
    rentStart = json["aluguelFeito"];
    rentEnd = json["previsaoEntrega"];
    devolution = json["devolucao"];
  }
}
