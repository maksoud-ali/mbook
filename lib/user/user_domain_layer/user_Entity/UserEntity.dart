import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;

  UserEntity(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website});

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website];
}

class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode});

  @override
  List<Object?> get props => [street, suite, city, zipcode];
}
