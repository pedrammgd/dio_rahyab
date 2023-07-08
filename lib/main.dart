import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyab_flutter/views/find_user/find_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FindUserPage(),
    );
  }
}
