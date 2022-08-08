



import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Exception.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userException.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userfailuer.dart';
import 'package:dartz/dartz.dart';
import 'package:mbook2/post/post_data_layer/post_data_model/post_model.dart';
import 'package:mbook2/user/user_data_layer/uder_data_local/user_data_local.dart';
import 'package:mbook2/user/user_data_layer/userModel.dart';
import 'package:mbook2/user/user_data_layer/user_data_web/userdataweb.dart';
import 'package:mbook2/user/user_domain_layer/User_Domain_repositery/user_domain_repositery.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';




class UserDataRepositery implements UserDomainRepositery {
 final UserDataWeb userDataWeb ;
 final UserDataLocal userDataLocal ;

  UserDataRepositery({required this.userDataWeb, required  this.userDataLocal}); 


  @override
  Future<Either<UserFailuer, UserEntity>> getUser({required int id})async {
if ( await InternetConnectionChecker().hasConnection) {
try {
  return Right(await userDataWeb.getUsers(id:  id)) ; 
} on UserServerException {
  return  Left(UserServerFailuer()) ;
}
  
} else {
  return Left(UserOfflineFailuer());
}
  }


  
  @override
  Future<Either<UserFailuer, Unit>> AddUser({required userModel}) async {
   if (await InternetConnectionChecker().hasConnection ) {
  try {

    return right( await userDataWeb.userAdd(userModel: userModel));
  } on UserServerFailuer {
    return Left(UserServerFailuer());
  }
  
} else {
  return Left(UserOfflineFailuer());
}
  }
  
  @override
  Future<Either<UserFailuer, bool>> userLogin({required String username, required String password}) async {
 if (  await  InternetConnectionChecker().hasConnection) {
   try {
   return  Right( await userDataWeb.checkIfuserinWebDb(usernameoremail: username, password: password)) ;  
   } on UserServerException {
    return Left(UserServerFailuer());
     
   }
 } else {
  return left(UserOfflineFailuer());
   
 }
  }
  


  
}