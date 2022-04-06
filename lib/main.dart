import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projectadvance/view/check_page.dart';

import 'package:projectadvance/view/login_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('session');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // const Hello(),
          const LoginView(),
    );
  }
}
