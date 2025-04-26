class Coordinates {
  final double? lat;
  final double? lng;

  Coordinates({this.lat, this.lng});

  factory Coordinates.fromMap(Map<String, dynamic> map) => Coordinates(
    lat: (map['lat'] as num?)?.toDouble(),
    lng: (map['lng'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toMap() => {'lat': lat, 'lng': lng};
}
