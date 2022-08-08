import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/core/constant/route_constant.dart';
import 'package:mbook2/core/dpendency%20injection/dpendency.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_present_layer/post%20screen/post%20add%20edeit%20page/post_add_edeit_page.dart';
import 'package:mbook2/post/post_present_layer/post%20screen/post%20deatils%20page/post_deatils_page.dart';
import 'package:mbook2/post/post_present_layer/post%20screen/post%20page/postpage.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_get/bloc/postget_bloc.dart';
import 'package:mbook2/splash.dart';
import 'package:mbook2/user/user_present_layer/login%20page/login_page.dart';


class AppRoute {



Route? onGenerateRoute(RouteSettings settings){
  switch (settings.name) {
    case splashpage: return MaterialPageRoute(builder: (context) =>const SplashPage() ) ;
    case loginpage : return MaterialPageRoute(builder: (context) => const LogInScreen()) ;
    case postsPage: return MaterialPageRoute(builder: (context) => BlocProvider(create:(context) => PostgetBloc(getAllPOstUseCasess: getit())..add(PostGetPostsEvent()) ,lazy: false,child:  const PostsPage(),)) ;
    case deatilspage : return MaterialPageRoute(builder: (context) => BlocProvider(create: (context) =>  PostAddEdeitBloc(addPOstUseCasess:getit(),deletePostUseCasess: getit(),updatePOstUseCasess: getit()),child: PostDeatilsPage( postEntity: settings.arguments as PostEntity, userpostorno: true),));
    case edietpage : return MaterialPageRoute(builder: (context) =>   PostAddEdeitPage(addorediet: false , postEntity: settings.arguments as PostEntity));
    case addpage : return MaterialPageRoute(builder: (context) =>  const PostAddEdeitPage(addorediet: true,postEntity:  null,)) ;
  }
  return null;

}
  
}