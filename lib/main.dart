import 'package:flutter/material.dart';
import 'package:ninja_trips/screens/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ninja Trips',
      home: LottiePage(),
    );
  }
}
