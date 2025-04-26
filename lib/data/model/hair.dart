class Hair {
  final String? color;
  final String? type;

  Hair({this.color, this.type});

  factory Hair.fromMap(Map<String, dynamic> map) =>
      Hair(color: map['color'] as String?, type: map['type'] as String?);

  Map<String, dynamic> toMap() => {'color': color, 'type': type};
}
