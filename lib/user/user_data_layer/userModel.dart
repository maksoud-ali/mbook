import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';


class UserModel extends UserEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;

  UserModel(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website})
      : super(
            email: email,
            name: name,
            id: id,
            address: address,
            phone: phone,
            username: username,
            website: website);

  factory UserModel.fronJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: json['address'],
        phone: json['phone'],
        website: json['website']);
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      'id': userModel.id,
      'name': userModel.name,
      'username': userModel.username,
      'email': userModel.email,
      'address': {
        'street': userModel.address.street,
        'suite': userModel.address.suite,
        'city': userModel.address.city,
        'zipcode': userModel.address.zipcode,
      },
      'phone': userModel.phone,
      'website': userModel.website,
    };
  }
}
