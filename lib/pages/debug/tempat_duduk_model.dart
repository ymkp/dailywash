class TempatDuduk {
  int id;
  double x;
  double y;
  String condition;
  int size;

  TempatDuduk({this.size, this.condition, this.id, this.x, this.y});

  factory TempatDuduk.fromJson(Map<String, dynamic> json){
    return TempatDuduk(
      id: json['id'],
      x: json['x'],
      y: json['y'],
      condition: json['condition'],
      size: json['size']
    );
  }
}