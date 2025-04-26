import 'package:tujuh_sembilan_request/data/model/address.dart';

class Company {
  final String? department;
  final String? name;
  final String? title;
  final Address? address;

  Company({this.department, this.name, this.title, this.address});

  factory Company.fromMap(Map<String, dynamic> map) => Company(
    department: map['department'] as String?,
    name: map['name'] as String?,
    title: map['title'] as String?,
    address: map['address'] != null ? Address.fromMap(map['address']) : null,
  );

  Map<String, dynamic> toMap() => {
    'department': department,
    'name': name,
    'title': title,
    'address': address?.toMap(),
  };
}
