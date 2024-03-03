import 'package:clock_app/view/screen/homescreen.dart';
import 'package:clock_app/view/screen/stopwatch.dart';
import 'package:clock_app/view/screen/timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>homescreen(),
        '/stop':(context)=>stopwatch(),
        '/timer':(context)=>timer(),
      },
    );
  }
}