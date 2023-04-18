import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/Splash/presentation/views/splash_view.dart';





void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor ,textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),),
      home:  const SplashView(),
    );
  }
}

