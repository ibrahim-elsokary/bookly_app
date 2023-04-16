import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/views/screens/splash_view.dart';



void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:  SplashView(),
    );
  }
}

