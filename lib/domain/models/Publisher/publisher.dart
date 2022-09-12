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

  Publisher copyWith({
    dynamic id,
    dynamic name,
    dynamic city,
  }) {
    return Publisher(
      id: id ?? this.id,
      name: name ?? this.name,
      city: city ?? this.city,
    );
  }
}
