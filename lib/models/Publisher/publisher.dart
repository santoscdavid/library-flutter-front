class Publisher {
  dynamic id;
  dynamic name;
  dynamic city;

  Publisher({
    this.id,
    required this.name,
    required this.city,
  });

  Publisher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    city = json['cidade'];
  }
}
