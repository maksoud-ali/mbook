// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';

import '../../postbloc/post_add_edeit/bloc/post_add_edeit_bloc.dart';

AppBar buildAppbarAddEdietPage(BuildContext context, bool addorediet) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
        addorediet ? MyStrings.add_page_title : MyStrings.edeit_page_title),
    backgroundColor: MyColor.myblue,
    actions: [Image.asset('lib/assets/splash.png')],
  );
}

Widget builBodyInitAddEdeitPage(
    {required BuildContext context,
    required TextEditingController titlecontroller,
    required TextEditingController bodycontroller,
    required bool addorediet,
    required PostEntity? postEntity}) {
  // ignore: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
  return Container(
    child: ListView(children: [
      const SizedBox(
        height: 15,
      ),
      //? post title text edieting /////////////////////////////
      Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: titlecontroller,
          minLines: 3,
          maxLines: 6,
          decoration: InputDecoration(
              hintText: 'Title',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
      const SizedBox(
        height: 15,
      ),

      //? ppost pody text edieting /////////////////////////////
      Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: bodycontroller,
          minLines: 6,
          maxLines: 12,
          decoration: InputDecoration(
              label: const Text('Body'),
              hintText: 'Body',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),

      //? build button /////////////////////////////////////

      Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Center(
          child: RaisedButton(
              onPressed: () {
                if (addorediet) {
                  context.read<PostAddEdeitBloc>().add(PostAddEvent(
                      postEntity: PostEntity(
                          id: 1,
                          userId: 1,
                          title: titlecontroller.text,
                          body: bodycontroller.text)));
                } else {
                  context
                      .read<PostAddEdeitBloc>()
                      .add(PostEdeitEvent(postEntity: postEntity!));
                }
              },
              color: const Color.fromARGB(255, 135, 236, 98),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(addorediet ? Icons.add : Icons.edit_note),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(addorediet ? MyStrings.addbutton : MyStrings.edeitbutton)
                ],
              )),
        ),
      )
    ]),
  );
}
