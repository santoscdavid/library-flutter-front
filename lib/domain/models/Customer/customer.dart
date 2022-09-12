class Customer {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic city;
  dynamic address;

  Customer({
    this.id,
    required this.name,
    required this.email,
    required this.city,
    required this.address,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    email = json['email'];
    city = json['cidade'];
    address = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = name;
    data['email'] = email;
    data['cidade'] = city;
    data['endereco'] = address;
    return data;
  }
}
