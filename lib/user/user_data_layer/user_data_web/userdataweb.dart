import 'package:dartz/dartz.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Exception.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userfailuer.dart';
import 'package:mbook2/user/user_data_layer/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDataWeb {
  final String endpointuser = 'https://jsonplaceholder.typicode.com/users/';

  Future<bool> checkIfuserinWebDb(
      {required String usernameoremail, required password}) async {
    final response = await http.get(Uri.parse(endpointuser));

    if (response.statusCode == 200) {
      final List list = json.decode(response.body);
      List<UserModel> users = list
          .map((e) => UserModel(
              id: e.id,
              name: e.name,
              username: e.username,
              email: e.email,
              address: e.address,
              phone: e.phone,
              website: e.website))
          .toList();
      bool check = false;
      for (var element in users) {
        if (((usernameoremail == element.name) ||
            (usernameoremail == element.email))) {
          check = true;
        }
      }
      return check;
    } else {
      throw ServerException();
    }
  }

  Future<Unit> userAdd ({required UserModel userModel})async{
  final response =await  http.post(Uri.parse(endpointuser + userModel.id.toString()));
  if (response.statusCode == 201) {
   return unit ;   
  } else {
    throw ServerException()
;  }  
  }


    Future<UserModel> getUsers({required int id}) async {
    final response = await http.get(Uri.parse(endpointuser));

    if (response.statusCode == 200) {
      final List list = json.decode(response.body);
      List<UserModel> users = list
          .map((e) => UserModel(
              id: e.id,
              name: e.name,
              username: e.username,
              email: e.email,
              address: e.address,
              phone: e.phone,
              website: e.website))
          .toList();
  UserModel? user ;
   for (var element in users) {
    if (id == element.id) {
  user = element ; 
    } 
     
   }
return user! ;
    } else {
      throw ServerException();
    }
  }
}
