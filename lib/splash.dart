import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mbook2/core/constant/mycolor.dart';
import 'package:mbook2/core/constant/route_constant.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context ,postsPage) );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: MyColor.myblue,
      child: Center(child: Image.asset('lib/assets/splash.png')),
    );
  }
}
