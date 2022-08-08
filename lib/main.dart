import 'package:flutter/material.dart';
import 'package:mbook2/core/app%20route/approute.dart';
import 'core/dpendency injection/dpendency.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized ;
  await di.init() ;
  runApp( MyApp(approute: AppRoute(),));
}

class MyApp extends StatelessWidget {
  final AppRoute approute ;
  const MyApp({Key? key, required this.approute}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'MBook',
      onGenerateRoute: approute.onGenerateRoute);
  }
}


