import 'package:get_it/get_it.dart';
import 'package:mbook2/post/post_data_layer/post_data_web/post_data_web.dart';
import 'package:mbook2/post/post_domain_layer/post_domain_repositry/post_domain_repositery.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_get/bloc/postget_bloc.dart';

import '../../post/post_data_layer/post_data_local/post_data_local.dart';
import '../../post/post_data_layer/post_data_repositery/post_data_repositery.dart';
import '../../post/post_domain_layer/post_usecasess/post_usecasess.dart';
import '../../post/post_present_layer/postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';

final getit = GetIt.instance;
Future<void> init() async {
  //!post /////////
  //? ppresention layer
  getit.registerFactory(() => PostgetBloc(getAllPOstUseCasess: getit()));
  getit.registerFactory(() => PostAddEdeitBloc(
      addPOstUseCasess: getit(),
      updatePOstUseCasess: getit(),
      deletePostUseCasess: getit()));

  //? domain layer
  getit.registerLazySingleton(
      () => GetAllPOstUseCasess(postDomainRepositery: getit()));

  getit.registerLazySingleton(
      () => AddPOstUseCasess(postDomainRepositery: getit()));
  getit.registerLazySingleton(
      () => UpdatePOstUseCasess(postDomainRepositery: getit()));
  getit.registerLazySingleton(
      () => DeletePostUseCasess(postDomainRepositery: getit()));
  //? data layer
  getit.registerLazySingleton<PostDomainRepositery>(
      () => PostDataRepositery(postDataLocal: getit(), postDataWeb: getit()));

  final postDataLocal = PostDataLocal.instance;

  getit.registerLazySingleton(() => PostDataWeb());
  getit.registerLazySingleton(() => postDataLocal);
}
