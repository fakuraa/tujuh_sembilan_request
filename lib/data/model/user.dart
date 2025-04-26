import 'dart:convert';

import 'package:tujuh_sembilan_request/data/model/address.dart';
import 'package:tujuh_sembilan_request/data/model/bank.dart';
import 'package:tujuh_sembilan_request/data/model/company.dart';
import 'package:tujuh_sembilan_request/data/model/crypto.dart';
import 'package:tujuh_sembilan_request/data/model/hair.dart';

class User {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? accessToken;
  String? refreshToken;

  // New fields
  String? maidenName;
  int? age;
  String? phone;
  String? password;
  String? birthDate;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;
  String? role;

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.accessToken,
    this.refreshToken,
    this.maidenName,
    this.age,
    this.phone,
    this.password,
    this.birthDate,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
    id: data['id'] as int?,
    username: data['username'] as String?,
    email: data['email'] as String?,
    firstName: data['firstName'] as String?,
    lastName: data['lastName'] as String?,
    gender: data['gender'] as String?,
    image: data['image'] as String?,
    accessToken: data['accessToken'] as String?,
    refreshToken: data['refreshToken'] as String?,
    maidenName: data['maidenName'] as String?,
    age: data['age'] as int?,
    phone: data['phone'] as String?,
    password: data['password'] as String?,
    birthDate: data['birthDate'] as String?,
    bloodGroup: data['bloodGroup'] as String?,
    height: (data['height'] as num?)?.toDouble(),
    weight: (data['weight'] as num?)?.toDouble(),
    eyeColor: data['eyeColor'] as String?,
    hair: data['hair'] != null ? Hair.fromMap(data['hair']) : null,
    ip: data['ip'] as String?,
    address: data['address'] != null ? Address.fromMap(data['address']) : null,
    macAddress: data['macAddress'] as String?,
    university: data['university'] as String?,
    bank: data['bank'] != null ? Bank.fromMap(data['bank']) : null,
    company: data['company'] != null ? Company.fromMap(data['company']) : null,
    ein: data['ein'] as String?,
    ssn: data['ssn'] as String?,
    userAgent: data['userAgent'] as String?,
    crypto: data['crypto'] != null ? Crypto.fromMap(data['crypto']) : null,
    role: data['role'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'gender': gender,
    'image': image,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'maidenName': maidenName,
    'age': age,
    'phone': phone,
    'password': password,
    'birthDate': birthDate,
    'bloodGroup': bloodGroup,
    'height': height,
    'weight': weight,
    'eyeColor': eyeColor,
    'hair': hair?.toMap(),
    'ip': ip,
    'address': address?.toMap(),
    'macAddress': macAddress,
    'university': university,
    'bank': bank?.toMap(),
    'company': company?.toMap(),
    'ein': ein,
    'ssn': ssn,
    'userAgent': userAgent,
    'crypto': crypto?.toMap(),
    'role': role,
  };

  factory User.fromJson(String data) =>
      User.fromMap(json.decode(data) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
