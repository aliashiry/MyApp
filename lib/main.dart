import 'package:flutter/material.dart';
import 'package:myapp/modules/bmi_result/bmi_result_screen.dart';
import 'package:myapp/modules/bmi/bmi_screen.dart';
import 'package:myapp/modules/counter/counter_screen.dart';
import 'package:myapp/modules/home/home_screen.dart';
import 'package:myapp/modules/messenger/messenger_screen.dart';
import 'package:myapp/modules/users/users_screen.dart';
import 'modules/login/login_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }

}
