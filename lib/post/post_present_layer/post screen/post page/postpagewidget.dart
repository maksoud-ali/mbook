// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Failuer.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_present_layer/postbloc/post_get/bloc/postget_bloc.dart';

Widget buildLoadinState(BuildContext context) {
  return Center(
    child: Image.asset(
      'lib/assets/loading.gif',
      height: 50,
      width: 50,
    ),
  );
}

Widget buildLoadedState(BuildContext context, List<PostEntity> posts) {
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          //   width: double.infinity,
          // height: double.infinity,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Column(children: [
                InkWell(
                  child: ListTile(
                    leading: Text(posts[index].id.toString()),
                    title: Text(posts[index].title.toString()),
                    subtitle: Text(posts[index].body.toString()),
                  ),
                  onTap: () {Navigator.of(context).pushNamed('deatils_page',arguments: posts[index]);},
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    itemtButton(
                        flex: 1,
                        function: () {},
                        height: 30,
                        textbutton: MyStrings.likebutton),
                    SizedBox(
                      width: 8,
                    ),
                    itemtButton(
                        flex: 1,
                        function: () {},
                        height: 30,
                        textbutton: MyStrings.commentutton),
                    SizedBox(
                      width: 8,
                    ),
                    itemtButton(
                        flex: 1,
                        height: 30,
                        function: () {},
                        textbutton: MyStrings.sharebutton),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
        );
      });
}

Widget buildPostPageFailuerState(BuildContext context, String failuer) {
  // ignore: prefer_const_literals_to_create_immutables
  return Container(
    color: Color.fromRGBO(254, 252, 252, 1),
    child: ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Image(
          image: AssetImage('lib/assets/ok.gif'),
          height: 200,
          width: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            failuer,
            style:
                TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
          child: Center(
            child: RaisedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.error),
                    SizedBox(
                      width: 10,
                    ),
                    Text(MyStrings.warnigstatebutton)
                  ],
                )),
          ),
        )
      ],
    ),
  );
}

Widget buildPostPageSucssesState(BuildContext context) {
  return Container(
    color: Color.fromRGBO(250, 250, 250, 250),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset('lib/assets/ok.gif'),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  color: Colors.green[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.done),
                      Text(MyStrings.warnigstatebutton)
                    ],
                  ),
                )),
          )
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Drawer MyDrawer() {
  return Drawer(
    // ignore: prefer_const_literals_to_create_immutables
    child: ListView(children: [
      UserAccountsDrawerHeader(
        accountName: Text('qqq'),
        accountEmail: Text('qqq'),
        currentAccountPicture: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('lib/assets/splash.png'),
        ),
      ),
    ]),
  );
}

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    title: const Text(MyStrings.post_page_title),
    backgroundColor: MyColor.myblue,
    actions: [
      Container(
        child: Image.asset('lib/assets/splash.png'),
      )
    ],
  );
}

Widget itemtButton(
    {required int flex,
    required double height,
    required void Function()? function,
    required String textbutton}) {
  return Flexible(
      flex: flex,
      child: Container(
          height: height,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 228, 225, 240),
            ),
            onPressed: function,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textbutton,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                )
              ],
            ),
          )));
}
  InkWell buildFloatingBtn(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.of(context).pushNamed('add_page') ;
    },
        child: FloatingActionButton(onPressed: (){Navigator.of(context).pushNamed('add_page');},backgroundColor: MyColor.myblue, child: Icon(Icons.add)),
      
      );
  }
