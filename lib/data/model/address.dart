import 'package:tujuh_sembilan_request/data/model/coordinates.dart';

class Address {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final String? country;
  final Coordinates? coordinates;

  Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.country,
    this.coordinates,
  });

  factory Address.fromMap(Map<String, dynamic> map) => Address(
    address: map['address'] as String?,
    city: map['city'] as String?,
    state: map['state'] as String?,
    stateCode: map['stateCode'] as String?,
    postalCode: map['postalCode'] as String?,
    country: map['country'] as String?,
    coordinates:
        map['coordinates'] != null
            ? Coordinates.fromMap(map['coordinates'])
            : null,
  );

  Map<String, dynamic> toMap() => {
    'address': address,
    'city': city,
    'state': state,
    'stateCode': stateCode,
    'postalCode': postalCode,
    'country': country,
    'coordinates': coordinates?.toMap(),
  };
}
