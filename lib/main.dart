import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myapp/layout/home_layout.dart';
import 'package:myapp/modules/counter/counter_screen.dart';
import 'package:myapp/modules/home/home_screen.dart';
import 'package:myapp/modules/login/login_screen.dart';
import 'package:myapp/modules/new_tasks/new_tasks_screen.dart';
import 'package:myapp/shared/bloc_observe.dart';

void main() {
  BlocOverrides.runZoned(
    () {
       runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home_Layout(),
    );
  }
}
