class Timeline {
  dynamic date;
  dynamic total;

  Timeline({
    required this.date,
    required this.total,
  });

  Timeline.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    total = json['total'];
  }
}
