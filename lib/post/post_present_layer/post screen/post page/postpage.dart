// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/post/post_present_layer/post%20screen/post%20page/postpagewidget.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_get/bloc/postget_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: buildAppbar(context),
        drawer: MyDrawer(),
        // ignore: prefer_const_constructors
        floatingActionButton: buildFloatingBtn(context) ,
        body: BlocConsumer<PostgetBloc, PostgetState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is PostgetLoadingState) {
              return buildLoadinState(context);
            } else if (state is PostgetLoadedState) {
              return buildLoadedState(context, state.posts);
            } else if (state is PostgetFailuerState) {
              return buildPostPageFailuerState(context ,state.failuer) ;
           
            }
            return buildLoadinState(context);
          },
        ),
      ),
    );
  }


}
